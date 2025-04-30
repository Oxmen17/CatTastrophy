extends Node2D

func _ready():
	$MainButtons/VBoxContainer/VBoxContainer/MarginContainer/StartGame.pressed.connect(_on_start_pressed)
	$MainButtons/VBoxContainer/VBoxContainer/MarginContainer2/ExitGame.pressed.connect(_on_quit_pressed)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scene/Levels/Level1.tscn".tscn")


func _on_quit_pressed():
	get_tree().quit()
