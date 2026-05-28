extends CharacterBody2D

var speed := 5000.0
var dir 

func _ready() -> void:
	add_to_group("player")

func _process(delta: float) -> void:
	dir = Input.get_vector("left","right", "up", "down").normalized()
	velocity = speed * dir * delta
	
	move_and_slide()
