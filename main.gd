extends Node

# Tutorial done! test

@export var mob_scene: PackedScene
@export var camera: Node3D
@export var player: Node3D
@export var camera_position: Node3D

# Light settings
@export var world_environment: WorldEnvironment
@export var day_exposure = 1
@export var night_exposure = 0

signal score_reset
signal score_increase

var camera_target_position: Transform3D

func _ready() -> void:
	$UserInterface/Retry.hide()
	world_environment.environment.tonemap_exposure = day_exposure
	score_reset.emit()
	# print("main ready")

func _on_player_hit() -> void:
	#$MobTimer.stop()
	# Show the "retry" menu
	$UserInterface/Retry.show()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		# This restarts the current scene.
		get_tree().reload_current_scene()


func _on_bulb_collect_picked() -> void:
	print("main: pickup collected")
	world_environment.environment.tonemap_exposure = night_exposure
	score_increase.emit()
