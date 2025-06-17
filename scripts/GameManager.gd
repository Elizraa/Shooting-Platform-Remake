extends Node

@onready var bullet_left = $CanvasLayer/BulletLeft

@export var bullets = 1

func _ready():
	bullet_left.text = 'x' + str(bullets)

func reduce_bullet():
	bullets -= 1
	bullet_left.text = 'x' + str(bullets)
