extends AnimatableBody2D

@export var target_pos := Vector2.ZERO
@export var elevator_speed := 75

@onready var init_pos := position

func activate():
	var tween = create_tween()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(self, "position", target_pos, target_pos.distance_to(position) / elevator_speed)

func deactivate():
	var tween = create_tween()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(self, "position", init_pos, init_pos.distance_to(position) / elevator_speed)
	
