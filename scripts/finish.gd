extends Area2D

@onready var timer = $Timer
@export var nextLevel = 1

func _on_body_entered(_body):
	print('You Finish!')
	timer.start()

func _on_timer_timeout():
	var scene_path = "res://scenes/levels/level%d.tscn" % nextLevel
	get_tree().change_scene_to_file(scene_path)
