extends StaticBody3D

# Signal emitted when the light bulb is collected
signal picked

func _ready():
	# print("item: Pickup ready")
	pass

# Function called when the player picks up this item
func pickup():
	print("item: pickup")
	picked.emit()
	queue_free()

# This function is called when the light bulb is in the player's view
func _on_visible_on_screen_notifier_3d_screen_entered():
	# print("item: Visible")
	pass
