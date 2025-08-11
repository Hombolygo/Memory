@tool
extends EditorScript

const PATH : String = "res://assets/glitch/"
const RESOURCE_PATH : String = "res://Resources/image_files_list.tres"

# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	var dir : DirAccess = DirAccess.open(PATH);
	var ifl: ImageFileListResource = ImageFileListResource.new();
	
	if dir:
		var files : PackedStringArray = dir.get_files();
		for file in files:
			ifl.add_file(PATH + file);
	ResourceSaver.save(ifl, RESOURCE_PATH)
	pass
 
