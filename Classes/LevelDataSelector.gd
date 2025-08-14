extends Object

class_name LevelDataSelector

const LEVELS_DATA : LevelDataResource = preload("res://Resources/levels_data.tres");

var _selected_images: Array[Texture2D];
var _level_setting: LevelSettingResource;

func _init(level_setting: LevelSettingResource, selected_images: Array[Texture2D]) -> void:
	_selected_images = selected_images;
	_level_setting = level_setting;

func get_target_pairs() -> int:
	return _level_setting.get_target_pairs();
	
func get_number_of_columns() -> int:
	return _level_setting.columns;

#region statics
static func get_level_setting(level: int) -> LevelSettingResource:
	return LEVELS_DATA.get_level_data(level);

static func get_level_selection(level_num:int) -> LevelDataSelector:
	var level_settings : LevelSettingResource = get_level_setting(level_num);
	
	if level_settings == null:
		return null;
	
	ImageManager.shuffle_images();
	
	var selected_images : Array[Texture2D];
	
	for i in range(level_settings.get_target_pairs()):
		selected_images.append(ImageManager.get_image(i));
		selected_images.append(ImageManager.get_image(i));
	
	selected_images.shuffle();
	
	return LevelDataSelector.new(level_settings, selected_images);
	pass;
	
	#endregion
