extends Area2D

@onready var win : PackedScene = preload("res://Character_Sprites/win.tscn")




func _on_area_entered(_area: Area2D) -> void:
		get_tree().change_scene_to_packed(win)
