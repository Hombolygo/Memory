extends Resource

class_name LevelSettingResource

@export var level_number : int
@export var rows : int
@export var columns : int

func get_target_pairs() -> int:
	return (rows * columns) / 2
