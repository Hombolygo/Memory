extends TextureButton

class_name MemoryTile

@onready var item_image: TextureRect = $ItemImage
@onready var frame_image: TextureRect = $FrameImage


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reveal(false);
	pass # Replace with function body.

func setup(image: Texture2D, frame: Texture2D) -> void:
	frame_image.texture = frame;
	item_image.texture = image;

func matcher_other_tile(other : MemoryTile) -> bool:
	return other != self and other.item_image.texture == self.item_image.texture

func kill_on_success() -> void:
	z_index = 1;
	var tween : Tween = create_tween();
	tween.set_parallel(true);
	tween.tween_property(self, "disabled", true, 0);
	
	tween.tween_property(self, "rotation_degrees", 1080, 0.5);
	tween.tween_property(self, "scale", Vector2(2,2),0.5);
	tween.set_parallel(false);
	tween.tween_interval(0.6);
	tween.tween_property(self, "scale", Vector2.ZERO, 0)
	
	scale = Vector2.ZERO;



func _on_pressed() -> void:
	if(Scorer.SelectionEnabled):
		SignalHub.MemoryTilePressed.emit(self);
	pass # Replace with function body.
	
func reveal(r : bool) -> void:
	frame_image.visible = r;
	item_image.visible = r;
