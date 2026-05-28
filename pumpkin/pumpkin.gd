extends Area2D

@export var pumpkinManager : PumpkinManager

@onready var sprite :=  $sprite
@onready var collider := $CollisionShape2D
@onready var decay := $decay_timer
@onready var animation := $AnimationPlayer
@onready var label := $Label
@onready var particles := $CPUParticles2D

# general vars
var hp : int
var tex : Texture2D
var decay_time : float

#size vars
var scale_ : float
var size_x : float
var size_y : float

func _ready() -> void:
	pumpkinManager = pumpkinManager.duplicate(true)
	add_to_group("pumpkins")
	hp = pumpkinManager.hp
	# texture
	tex = pumpkinManager.texture
	sprite.texture = tex
	
	#scale
	scale_ = 2
	sprite.scale = Vector2(scale_, scale_)
	
	size_x = tex.get_size().x #for collider
	size_y = tex.get_size().y #same thing bru, ion wanna sound like ai
	
	collider.shape.size.x = (size_x - 12) * scale_
	collider.shape.size.y = (size_y - 12) * scale_
	
	#set decay timer
	decay.wait_time = pumpkinManager.decay_time
	decay.start()
	# print("x: " + str(size_x) + "\ny: " + str(size_y)) #DEBUG

func _process(delta: float) -> void:
	label.text = "HP: " + str(hp)
	

func _on_decay_timer_timeout() -> void:
	queue_free()

func _on_mouse_entered() -> void:
	animation.play("damage")
	particles.emitting = true
	if animation.animation_finished:
		hp -= 1
	if hp <= 0:
		animation.play("succumb")
		if not animation.animation_finished:
			queue_free()
