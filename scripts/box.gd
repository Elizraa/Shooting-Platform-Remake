extends StaticBody2D

@export var custom_texture: Texture2D
@onready var fruit: Sprite2D = $Fruit

func _ready():
	if custom_texture:
		fruit.texture = custom_texture
