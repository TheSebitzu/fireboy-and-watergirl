extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/settings.tscn")

func _on_levels_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/levels.tscn")
