extends Control

@export var Level1: PackedScene
@export var Level2: PackedScene
@export var Level3: PackedScene
@export var Level4: PackedScene
@export var Level5: PackedScene


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_level_1_pressed() -> void:
	print("Load Level 1")
	get_tree().change_scene_to_packed(Level1)


func _on_level_2_pressed() -> void:
	print("Load Level 2")
	get_tree().change_scene_to_packed(Level2)


func _on_level_3_pressed() -> void:
	print("Load Level 3")
	get_tree().change_scene_to_packed(Level3)


func _on_level_4_pressed() -> void:
	print("Load Level 4")
	get_tree().change_scene_to_packed(Level4)


func _on_level_5_pressed() -> void:
	print("Load Level 5")
	get_tree().change_scene_to_packed(Level5)
