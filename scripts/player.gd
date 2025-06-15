extends CharacterBody2D

const SPEED = 90.0
const JUMP_VELOCITY = -240.0
@onready var shoot_point = $ShootPoint
@onready var animated_sprite = $AnimatedSprite2D
@onready var game_manager = %GameManager
@onready var jump = $Jump

@export var platform_scene: PackedScene

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		jump.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	update_direction(direction)
	
	play_animations(direction)

func update_direction(input_dir: float):
	if input_dir > 0:
		animated_sprite.flip_h = false  # Face right
		shoot_point.position.x = abs(shoot_point.position.x)
	elif input_dir < 0:
		animated_sprite.flip_h = true   # Face left
		shoot_point.position.x = -abs(shoot_point.position.x)
	
# Play Animations

func play_animations(direction):
	if !is_on_floor():
		animated_sprite.play("jump")
		return
	
	if direction == 0:
		animated_sprite.play('idle')
		return
	
	animated_sprite.play("running")

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot_platform()

func shoot_platform():
	if game_manager.bullets == 0:
		return
	var platform = platform_scene.instantiate()
	platform.position = shoot_point.global_position
	platform.direction = Vector2.RIGHT if !animated_sprite.flip_h else Vector2.LEFT
	get_tree().current_scene.add_child(platform)
	game_manager.reduce_bullet()
	
