extends Node2D

const ELEVATOR_SPEED = 100

var fire_inside = false
var water_inside = false
var point_target = 0
var scene: String
var rm = false



@export var fireboy: Player
@export var watergirl: Player
@export var foreground: TileMapLayer
@export var win_screen: Control
@onready var fire_door: Area2D = $Doors/FireDoor
@onready var water_door: Area2D = $Doors/WaterDoor
@onready var points_reminder_label: Label = $PointsReminderLabel
@onready var fire_score_label: Label = $Points/FireScoreLabel
@onready var water_score_label: Label = $Points/WaterScoreLabel
@onready var lose_screen: Control = $LoseScreen
@onready var elevator: AnimatableBody2D = $Harta/Elevator
@onready var elevator_anim: AnimationPlayer = $Harta/Elevator/AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Count points added to level
	await get_tree().process_frame
	for i in foreground.get_children():
		if i is Point:
			point_target += 1

	scene = get_tree().get_current_scene().get_name()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Check if fireboy finishes
	if fireboy.finish and fireboy.points == point_target / 2:
		fire_inside = true
		fire_door.open()
	else:
		fire_inside = false
		fire_door.closed()
	
	# Check if watergirl finishes
	if watergirl.finish and watergirl.points == point_target / 2:
		water_inside = true
		water_door.open()
	else:
		water_inside = false
		water_door.closed()
	
	# Prompt if the point target isnt met
	if fireboy.finish and fireboy.points != point_target / 2 or watergirl.finish and watergirl.points != point_target / 2:
		points_reminder_label.show()
	else:
		points_reminder_label.hide()
	
	# Winning game
	if water_inside and fire_inside:
		fireboy.can_move = false
		watergirl.can_move = false
		await get_tree().create_timer(0.3).timeout
		win_screen.show()
		Global.last_level = int(scene[-1])
		#await get_tree().create_timer(0.3).timeout
		get_tree().change_scene_to_file("res://Scenes/Menu/LevelsMenu/levels.tscn")
	# Lose screen
	if not fireboy.alive or not watergirl.alive:
		fireboy.can_move = false
		watergirl.can_move = false
		await get_tree().create_timer(0.3).timeout
		lose_screen.show()
	
	# Point labels
	fire_score_label.text = "Fire points: %s" %fireboy.points
	water_score_label.text = "Water points: %s" %watergirl.points
	


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")


#func _on_down_elevator_button_body_entered(body: Node2D) -> void:
	#var tween = create_tween()
	#tween.tween_property(elevator, "position", Vector2(866, 170), )
#
#
#func _on_up_elevator_button_2_body_entered(body: Node2D) -> void:
	#var tween = create_tween()
	#tween.tween_property(elevator, "position", Vector2(866, 170), )
#
#
#func _on_down_elevator_button_body_exited(body: Node2D) -> void:
	#var tween = create_tween()
	#tween.tween_property(elevator, "position", Vector2(866, 314), )
#
#func _on_up_elevator_button_2_body_exited(body: Node2D) -> void:
	#var tween = create_tween()
	#tween.tween_property(elevator, "position", Vector2(866, 314), )
