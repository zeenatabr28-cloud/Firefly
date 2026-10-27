class_name MainMenu
extends Control

@onready var start: Button = $TextureRect/VBoxContainer/Start
@onready var exit: Button = $TextureRect/VBoxContainer/Exit
@onready var game: PackedScene = preload("res://Game_Scenes/Levels/Start/01.tscn") 

func _ready():
	start.button_down.connect(on_start_pressed)
	exit.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(game)
	pass

func on_exit_pressed() -> void:
	get_tree().quit()
