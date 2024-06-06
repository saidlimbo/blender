extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 5.0
const ROTATE = 0.1
var is_loked = false
@export var sens_horizontal = 0.3
@export var sens_vertical = 0.3
var move_vec = Vector3()
@onready var camera_mount = $untitled/camera_mount
@onready var AnimPlayer = $untitled/AnimationPlayer
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	# Handle jump.
	move_vec = move_vec.normalized()
	if !AnimPlayer.is_playing():
		is_loked = false
	# Get the input direction and handle the movement/deceleration.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("right", "left", "down", "up")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if !is_loked:
			if AnimPlayer.current_animation != "Run":
				AnimPlayer.play("Run")
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		if !is_loked:
			if AnimPlayer.current_animation != "Iddle":
				AnimPlayer.play("Iddle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()


