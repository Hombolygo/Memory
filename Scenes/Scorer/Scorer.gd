extends Node

class_name Scorer

@onready var sound: AudioStreamPlayer = $Sound
@onready var reveal_timer: Timer = $RevealTimer

static var SelectionEnabled: bool = true;

var _selections : Array[MemoryTile];
var _target_pairs : int = 0;
var _moves : int = 0;
var _pairs : int = 0;

func get_moves_made() -> String:
	return str(_moves);
	
func get_pairs_made() -> String:
	return str(_pairs);

func _enter_tree() -> void:
	SignalHub.MemoryTilePressed.connect(tile_pressed);

func clear_new_game(target : int) -> void:
	_selections.clear();
	_target_pairs = target;
	_moves = 0;
	_pairs = 0;
	SelectionEnabled = true;

func tile_pressed(tile : MemoryTile) -> void:
	if  _selections.has(tile):
		return;
	_moves += 1;
	_selections.append(tile);
	tile.reveal(true);
	SoundManager.play_tile_click(sound);
	if _selections.size() == 2:
		SelectionEnabled = false;
		process_pair();
		if _selections[0].matcher_other_tile(_selections[1]):
			_pairs += 1;
			_selections[0].kill_on_success()
			_selections[1].kill_on_success()
			
		SoundManager.play_sound(sound, SoundManager.SOUND_SUCCESS);
			
		
		##dosomething
		
	
func process_pair() -> void:
	if _selections.size() != 2:
		return;
	SelectionEnabled = true;
	reveal_timer.start();
	
func check_game_over() -> void:
	if _target_pairs == _pairs:
		SelectionEnabled = false;
		SignalHub.GameOver.emit(_moves);
	else:
		SelectionEnabled = true;

func _on_reveal_timer_timeout() -> void:
	for s in _selections:
		s.reveal(false);
	_selections.clear();
	check_game_over();
	pass # Replace with function body.
