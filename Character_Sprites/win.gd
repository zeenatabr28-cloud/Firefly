extends Control

@onready var quit_game: Button = $HBoxContainer/Quit_Game


func _ready() -> void:
	quit_game.pressed.connect(on_exit_game_pressed)

func on_exit_game_pressed() -> void:
	get_tree().quit()
