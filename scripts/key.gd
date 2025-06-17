extends RigidBody2D

@export var door: AnimationPlayer
@export var sprite: AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body: Node2D) -> void:
	print('picked', _body.name)
	sprite.hide()
	animation_player.play('pickup')
	#door.play('fade_out')
