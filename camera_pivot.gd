extends StaticBody3D

@export var speed: float = 10
var target_coordinates
var direction
var distance_to_target
var camera_moving = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if camera_moving == true:
		# Move the camera in the direction of the new camera pivot
		direction = (target_coordinates - position).normalized()
		distance_to_target = (target_coordinates - position).length()
		print("distance = ", distance_to_target)
		if distance_to_target > 1:
			position += (direction * speed * delta)
		else:
			position = target_coordinates
			camera_moving = false
	


func _on_player_camera_screen(target_position: Variant) -> void:
	if target_position != Vector3.ZERO:
		target_coordinates = target_position
		camera_moving = true
