extends Node2D


var fire_inside = false
var water_inside = false
var point_target = 0




@export var fireboy: Player
@export var watergirl: Player
@export var foreground: TileMapLayer
@export var win_label: Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	for i in foreground.get_children():
		if i is Point:
			point_target += 1



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if fireboy.finish and watergirl.finish and (fireboy.points + watergirl.points == point_target):
		fireboy.can_move = false
		watergirl.can_move = false
		win_label.show()


func _on_fire_door_body_entered(body: Node2D) -> void:
	fire_inside = true

func _on_fire_door_body_exited(body: Node2D) -> void:
	fire_inside = false



func _on_water_door_body_entered(body: Node2D) -> void:
	water_inside = true


func _on_water_door_body_exited(body: Node2D) -> void:
	water_inside = false


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")
