extends Control
const MEMORY_TILE = preload("res://Scenes/MemoryTile/MemoryTile.tscn")
@onready var tile_grid: GridContainer = $HBoxContainer2/TileGrid
@onready var scorer: Scorer = $Scorer
@onready var sound: AudioStreamPlayer = $sound
@onready var moves_label: Label = $HBoxContainer2/MarginContainer/VBoxContainer/HBoxContainer/MovesLabel
@onready var pairs_label: Label = $HBoxContainer2/MarginContainer/VBoxContainer/HBoxContainer2/PairsLabel

func _on_exit_button_pressed() -> void:
	for t in tile_grid.get_children():
		t.queue_free(); 
	scorer._selections.clear();
	SoundManager.play_button_click(sound);
	SignalHub.show_menu.emit();
	pass # Replace with function body.

func _process(delta: float) -> void:
	moves_label.text = scorer.get_moves_made();
	pairs_label.text = scorer.get_pairs_made();
	pass;

func _enter_tree() -> void:
	SignalHub.show_game.connect(level_selected)
	
func level_selected(level_number: int) -> void:
	var lds : LevelDataSelector = LevelDataSelector.get_level_selection(level_number);
	
	var frame_image : Texture2D = ImageManager.get_random_frame_image();
	tile_grid.columns = lds.get_number_of_columns();
	
	for im in lds._selected_images:
		add_memory_tile(im, frame_image);
	scorer.clear_new_game(lds.get_target_pairs());
	pass;

func add_memory_tile(image: Texture2D, frame: Texture2D) -> void:
	var mt : MemoryTile = MEMORY_TILE.instantiate();
	tile_grid.add_child(mt);
	mt.setup(image, frame);
	
	
	
	
	
