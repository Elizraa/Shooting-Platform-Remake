extends CharacterBody2D

@export var speed: float = 2100
@export var direction := Vector2.RIGHT

func _physics_process(delta):
	velocity = direction * speed * delta
	move_and_slide()
