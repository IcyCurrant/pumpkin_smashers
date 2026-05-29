extends Node

enum States {IDLE, RUN, HARVEST}

var state = States.IDLE

func _change_state(newState):
	state = newState

func _physics_process(delta: float) -> void:
	match state:
		States.IDLE:
			_idle()
		States.RUN:
			_run()
		States.HARVEST:
			_harvest()

func _idle():
	if Input.is_action_pressed("smash"):
		_change_state(States.HARVEST)
	
	if Input.is_action_just_pressed("up") or Input.is_action_just_pressed("down") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
		_change_state(States.RUN)

func _run():
	if Input.is_action_just_released("up") or Input.is_action_just_released("down") or Input.is_action_just_released("left") or Input.is_action_just_released("right") :
		_change_state(States.IDLE)
 
func _harvest():
	if Input.is_action_just_released("up") or Input.is_action_just_released("down") or Input.is_action_just_released("left") or Input.is_action_just_released("right") :
		_change_state(States.IDLE)
