extends StaticBody3D

signal picked

func _ready():
	pass

# When the player picks up this item
func pickup():
	picked.emit()
	queue_free()

func _on_visible_on_screen_notifier_3d_screen_entered():
	print("visible")
