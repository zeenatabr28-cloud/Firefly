class_name PlayerStateJump
extends PlayerState

@export var jump_velocity : float = 300


func init() -> void:
	pass


func enter() -> void:
	player.velocity.y = - jump_velocity
	player.animated_sprite_2d.play("Jump")
	pass


func exit() -> void:
	pass


func handle_input(event : InputEvent) -> PlayerState:
	if event.is_action_released("Jump"):
		player.velocity.y *= 0.5
		return fall
	return next_state


func process(_delta: float) -> PlayerState:
	return next_state

func physics_process(_delta: float) -> PlayerState:
	if player.is_on_floor():
		return idle
	elif player.velocity.y >= 0:
		return fall
	player.velocity.x = player.direction.x * player.move_speed
	return null
