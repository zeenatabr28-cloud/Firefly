class_name PlayerStateRun 
extends PlayerState

@export var run_velocity : float = 300

func init() -> void:
	pass


func enter() -> void:
	player.velocity.x = - run_velocity
	pass


func exit() -> void:
	pass


func handle_input(event : InputEvent) -> PlayerState:
	if event.is_action_pressed("Run"):
		return jump
	return next_state


func process(_delta: float) -> PlayerState:
	if player.direction.x == 0:
		return idle
	return next_state

func physics_process(_delta: float) -> PlayerState:
	player.velocity.x = player.direction.x * player.move_speed
	if player.is_on_floor() == false:
		return fall
	return null
