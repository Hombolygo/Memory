extends TextureButton

@export var level_button_number : int = 1;
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ls : LevelSettingResource = LevelDataSelector.get_level_setting(level_button_number)
	if ls == null:
		queue_free();
	else:
		label.text = "%dx%d" % [ls.columns, ls.rows]
		
	pass # Replace with function body.


func _on_pressed() -> void:
	pass # Replace with function body.
