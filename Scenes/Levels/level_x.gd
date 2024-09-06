extends Node2D


var fire_inside = false
var water_inside = false
var point_target = 0




@export var fireboy: Player
@export var watergirl: Player
@export var foreground: TileMapLayer
@export var win_label: Label
@onready var fire_door: Area2D = $Doors/FireDoor
@onready var water_door: Area2D = $Doors/WaterDoor
@onready var points_reminder_label: Label = $PointsReminderLabel
@onready var fire_score_label: Label = $FireScoreLabel
@onready var water_score_label: Label = $WaterScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	for i in foreground.get_children():
		if i is Point:
			point_target += 1



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if fireboy.finish and fireboy.points == point_target / 2:
		fire_inside = true
		fire_door.open()
	else:
		fire_inside = false
		fire_door.closed()

	if watergirl.finish and watergirl.points == point_target / 2:
		water_inside = true
		water_door.open()
	else:
		water_inside = false
		water_door.closed()
	
	if fireboy.finish and fireboy.points != point_target / 2 or watergirl.finish and watergirl.points != point_target / 2:
		points_reminder_label.show()
	else:
		points_reminder_label.hide()

	if water_inside and fire_inside:
		fireboy.can_move = false
		watergirl.can_move = false
		win_label.show()

	fire_score_label.text = "Fire points: %s" %fireboy.points
	water_score_label.text = "Water points: %s" %watergirl.points

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")
