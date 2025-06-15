extends CharacterBody2D

@export var speed: float = 2100
@export var direction: Vector2 = Vector2.RIGHT

var external_force := Vector2.ZERO

func _physics_process(delta):
	var internal_velocity = direction.normalized() * speed
	velocity = (internal_velocity + external_force) * delta
	move_and_slide()
	
	# Reset external force so wind must reapply it each frame
	external_force = Vector2.ZERO
