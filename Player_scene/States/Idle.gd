class_name PlayerStateIdle
extends PlayerState


func init() -> void:
	pass


func enter() -> void:
	player.animated_sprite_2d.play("Idle")
	pass


func exit() -> void:
	pass


func handle_input(event : InputEvent) -> PlayerState:
	if event.is_action_pressed("Jump"):
		return jump
	return next_state


func process(_delta: float) -> PlayerState:
	if player.direction.x != 0:
		return walk
	return next_state

func physics_process(_delta: float) -> PlayerState:
	if player.direction.x != 0:
		return walk
	player.velocity.x = 0
	if player.is_on_floor() == false:
		return fall
	return next_state
