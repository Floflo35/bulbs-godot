extends CharacterBody3D

# Emitted when the player was hit by a mob.
signal hit

# How fast the player moves in meters per second.
@export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75
# Vertical impulse applied to the character upon jumping in meters per second.
@export var jump_impulse = 20
# Same thing but when the player bounces on monsters
@export var bounce_impulse = 16

var target_velocity = Vector3.ZERO

func _ready() -> void:
	print("ready")


func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.basis = Basis.looking_at(direction)
		$AnimationPlayer.speed_scale = 4
	else:
		$AnimationPlayer.speed_scale = 1

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
	
	# Jumping
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		target_velocity.y = jump_impulse
	
	# Iterate through all collisions that occurred this frame
	for index in range(get_slide_collision_count()):
		# We get one of the collisions with the player
		var collision = get_slide_collision(index)
		
		# If the collision is with ground
		if collision.get_collider() == null:
			continue
			
		if collision.get_collider().is_in_group("collectibles"):
			print("item!")
			var collectible = collision.get_collider()
			collectible.pickup()
			
		# If the collision is with a mob
		if collision.get_collider().is_in_group("mob"):
			var mob = collision.get_collider()
			# we check that we are hitting it from above.
			if Vector3.UP.dot(collision.get_normal()) > 0.1:
				mob.squash()
				target_velocity.y = bounce_impulse
				# Prevent further duplicate calls.
				break
				
		if collision.get_collider().is_in_group("collectible"):
			#var collectible = collision.get_collider()
			print("collected")
			#collectible.pickup()
	
	# Moving the Character
	velocity = target_velocity
	move_and_slide()
	
	$Pivot.rotation.x = PI / 6 * velocity.y / jump_impulse

func die():
	hit.emit()
	queue_free()

func _on_mob_detector_body_entered(_body):
	die()
	

func _on_pickup_detector_body_entered(_body) -> void:
	print ("pickup item detected!")
