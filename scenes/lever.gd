extends Area2D

@export var platform: Node2D
@export var target_position_node: Node2D  # This is the target position object
@export var speed: float = 100.0

var triggered := false
var original_position: Vector2

func _ready():
	if platform:
		original_position = platform.position

func _physics_process(delta):
	if not platform:
		return

	var target: Vector2
	if triggered and target_position_node:
		target = target_position_node.global_position
	else:
		target = original_position

	var to_target = target - platform.global_position

	if to_target.length() > 1.0:
		platform.global_position += to_target.normalized() * speed * delta
		# Snap to position if close enough
		if (platform.global_position - target).length() < speed * delta:
			platform.global_position = target

func _on_body_entered(_body: Node2D) -> void:
	triggered = true

func _on_body_exited(_body: Node2D) -> void:
	triggered = false
