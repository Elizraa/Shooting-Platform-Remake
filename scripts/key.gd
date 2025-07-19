extends RigidBody2D

@export var doors: Node
@export var sprite: AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(_body: Node2D) -> void:
	print('picked', _body.name)
	sprite.hide()
	animation_player.play('pickup')
	
	for door in doors.get_children():
		var anim_player = door.get_node_or_null('AnimationPlayer')
		if anim_player:
			anim_player.play('dissapear')
