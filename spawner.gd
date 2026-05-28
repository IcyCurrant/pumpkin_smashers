extends Node2D

var pumpkin_scene = preload("res://pumpkin/pumpkin.tscn")
var pumpkin

func _ready() -> void:
	$Timer.wait_time = randf_range(0.1,0.5)

func _on_timer_timeout() -> void:
	spawn_pumpkin()

func spawn_pumpkin():
	pumpkin = pumpkin_scene.instantiate()
	pumpkin.global_position = global_position
	get_tree().root.add_child(pumpkin)
	self.global_position = Vector2(randf_range(-1000,1000),randf_range(-500,500))
