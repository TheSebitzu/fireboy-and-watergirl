extends Area2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _on_body_entered(body):
	body.entered()
	
func _on_body_exited(body):
	body.exited()

func closed():
	anim.play("default")

func open():
	anim.play("opened")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
