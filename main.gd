extends Node

# Tutorial done! test

@export var mob_scene: PackedScene
@export var camera: Node3D
@export var player: Node3D
@export var camera_position: Node3D
var camera_target_position: Transform3D

func _ready() -> void:
	$UserInterface/Retry.hide()
	print("main ready")

func _on_player_hit() -> void:
	#$MobTimer.stop()
	# Show the "retry" menu
	$UserInterface/Retry.show()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		# This restarts the current scene.
		get_tree().reload_current_scene()

func _on_bulb_collect_picked() -> void:
	print("collectible picked up! 1 (main.gd)")

func _on_player_pickup() -> void:
	print("collectible picked up! 2 (main.gd)")


func _on_player_out_of_screen() -> void:
	if camera != null && camera_position != null:
		camera.position = camera_position.position
	print ("player out of screen")
