class_name Player
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var character: String = ""
@onready var sprite_2d: Sprite2D = $Sprite2D

var points = 0
var can_move = true
var finish = false

func kill():
	sprite_2d.texture = load("res://Scenes/Characters/smoke.png")
	var tween = create_tween()
	tween.parallel().tween_property(sprite_2d, "position:y", -30, 1)
	tween.parallel().tween_property(sprite_2d, "scale", Vector2(0.3, 0.3), 1)
	tween.parallel().tween_property(sprite_2d, "modulate:a", 0, 1.2)
	can_move = false

func add_point():
	points += 1
	print(points)

func entered():
	finish = true
	
func exited():
	finish = false

func _physics_process(delta: float) -> void:
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if not can_move:
		return
		
	# Handle jump.
	if Input.is_action_just_pressed(character + "_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis(character + "_left", character + "_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	
	
