extends Area3D

signal camera_move

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func switch_pivot() -> void:
	print("camera_zone switch pivot")
	camera_move.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass

func _on_body_entered(body: Node3D) -> void:
	camera_move.emit(self.position)
