extends CharacterBody3D


const speed = 5.0
const JUMP_VELOCITY = 4.5


@export var fall_acceleration = 75

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var target_velocity = Vector3.ZERO



func _physics_process(delta):
	# Add the gravity.
	var direction = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	if Input.is_action_pressed("move_backward"):
		direction.z += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
		

	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

		# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

		# Moving the Character
	velocity = target_velocity
	move_and_slide()
