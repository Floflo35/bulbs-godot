extends StaticBody3D

signal picked_up

func _ready():
	pass

# When the player picks up this item
func pickup():
	picked_up.emit()
	queue_free()
