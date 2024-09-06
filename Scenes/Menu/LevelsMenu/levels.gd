extends Node2D

@onready var level_error_prompt: Control = $LevelErrorPrompt
@onready var level_error_label: Label = $LevelErrorPrompt/LevelErrorLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")

func _on_level_2_button_pressed() -> void:
	if Global.last_level == 1:
		get_tree().change_scene_to_file("res://Scenes/Levels/level_2.tscn")
	else:
		level_error_label.text = "Please complete level 1"
		level_error_prompt.show()
		await get_tree().create_timer(0.5).timeout
		level_error_prompt.hide()

func _on_level_3_button_pressed() -> void:
	if Global.last_level == 2:
		get_tree().change_scene_to_file("res://Scenes/Levels/level_3.tscn")
	else:
		level_error_label.text = "Please complete level 2"
		level_error_prompt.show()
		await get_tree().create_timer(0.5).timeout
		level_error_prompt.hide()

func _on_level_4_button_pressed() -> void:
	if Global.last_level == 3:
		get_tree().change_scene_to_file("res://Scenes/Levels/level_4.tscn")
	else:
		level_error_label.text = "Please complete level 3"
		level_error_prompt.show()
		await get_tree().create_timer(0.5).timeout
		level_error_prompt.hide()
