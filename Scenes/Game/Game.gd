extends Control





func _on_exit_button_pressed() -> void:
	SignalHub.show_menu.emit();
	pass # Replace with function body.
