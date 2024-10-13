extends Node

# Tutorial done!

@export var mob_scene: PackedScene

func _ready() -> void:
	$UserInterface/Retry.hide()

func _on_player_hit() -> void:
	#$MobTimer.stop()
	# Show the "retry" menu
	$UserInterface/Retry.show()
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		# This restarts the current scene.
		get_tree().reload_current_scene()
		
