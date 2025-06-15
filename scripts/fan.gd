extends Node2D

@export var wind_force: float = 300.0
@export var direction: Vector2 = Vector2.UP

var affected_bodies := []

func _physics_process(_delta: float):
	for body in affected_bodies:
		body.external_force += direction.normalized() * wind_force

func _on_area_2d_body_entered(body: Node2D):
	affected_bodies.append(body)
	
func _on_area_2d_body_exited(body: Node2D):
	affected_bodies.erase(body)
