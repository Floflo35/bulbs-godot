extends Node3D

@export var speed: float = 10
var target_coordinates = Vector3.ZERO
var direction
var distance_to_target
var camera_moving = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if camera_moving == true:
		# Move the camera in the direction of the new camera pivot
		direction = (target_coordinates - position).normalized()
		distance_to_target = (target_coordinates - position).length()
		if distance_to_target > 1:
			position += (direction * speed * delta)
		else:
			position = target_coordinates
			camera_moving = false

# When a camera zone is triggered by the player
func _on_camera_zone_camera_move(target_position: Variant) -> void:
	if target_position != Vector3.ZERO:
		target_coordinates = target_position
		camera_moving = true
