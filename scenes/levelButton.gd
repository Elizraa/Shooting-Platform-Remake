extends Button

var level;

func _ready():
	level = int(text)

func _on_pressed():
	var scene_path = "res://scenes/levels/level%d.tscn" % level
	get_tree().change_scene_to_file(scene_path)
