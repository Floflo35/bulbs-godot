extends StaticBody3D

@export var speed: float = 10
var target_coordinates
var direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if direction != Vector3.ZERO:
		# Move the camera in the direction of the new camera pivot
		print("camera moving")
		direction = (target_coordinates - position).normalized()
		print("camera direction = ", direction)
		position += (direction * speed * delta)
		print("camera position = ", position)
	


func _on_player_camera_screen(target_position: Variant) -> void:
	if target_position != Vector3.ZERO:
		target_coordinates = target_position
		print("bop ", target_position.x, " ", target_position.z)
		print("bip ", self.position.x, " ", self.position.z)
		# direction = (target_position - position).normalized()
