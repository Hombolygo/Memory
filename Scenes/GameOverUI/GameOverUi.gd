extends Control

@onready var moves_label: Label = $NinePatchRect/VB/MovesLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.show_menu.connect(exit_to_menu)
	SignalHub.GameOver.connect(on_game_over)
	pass # Replace with function body.

func on_game_over(moves : int) -> void:
	show();
	moves_label.text = "You took %d moves" % moves
	
func exit_to_menu() -> void:
	hide();
