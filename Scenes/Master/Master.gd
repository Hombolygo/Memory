extends Control

@onready var music: AudioStreamPlayer = $Music
@onready var main: Control = $Main
@onready var game: Control = $Game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exit_button_pressed();
	pass # Replace with function body.

func _enter_tree() -> void:
	SignalHub.show_game.connect(game_button_pressed);
	SignalHub.show_menu.connect(exit_button_pressed);

func game_button_pressed(level_number: int) -> void:
	SoundManager.play_sound(music, SoundManager.SOUND_IN_GAME)
	show_game(true);
	pass;
	
func exit_button_pressed() -> void:
	SoundManager.play_sound(music, SoundManager.SOUND_MAIN_MENU)
	show_game(false);
	pass

func show_game(s: bool) -> void:
	game.visible = s;
	main.visible = !s;
