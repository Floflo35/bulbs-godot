extends Area3D

signal camera_move

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if self.name != null:
		# print("Camera pivot: ", self.name, " started to exist")
		print("Camera pivot ready in: x=", round(self.position.x), " y=", round(self.position.y), " z=", round(self.position.z))
	pass
	
func switch_pivot() -> void:
	print("camera_zone switch pivot")
	camera_move.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass


func _on_player_camera_screen(current_camera_position: Variant) -> void:
	pass # Replace with function body.
