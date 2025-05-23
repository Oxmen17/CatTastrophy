extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -250.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Play animations
	if (velocity.x > 1 || velocity.x < -1):
		animated_sprite_2d.animation = ("running")
	else:
			animated_sprite_2d.animation = ("IDL")
	
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animated_sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 1, SPEED)

	move_and_slide()
	var isLeft = velocity.x < 0 
	animated_sprite_2d.flip_h = isLeft
@onready var sprite_2d = $AnimatedSprite2D
