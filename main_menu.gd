extends Control

@export var Level1: PackedScene


func _on_start_game_pressed() -> void:
	print("Load Level 1")
	get_tree().change_scene_to_packed(Level1)


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
