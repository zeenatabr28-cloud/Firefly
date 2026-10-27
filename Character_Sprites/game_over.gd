extends Control

@onready var quit_game: Button = $HBoxContainer/Quit_Game
@onready var menu: PackedScene = preload("res://Main_Menu/Main_Menu.tscn")

func _ready() -> void:
	quit_game.pressed.connect(on_exit_game_pressed)

func on_exit_game_pressed() -> void:
	get_tree().change_scene_to_packed(menu)
