extends KinematicBody2D

export var move_speed = 175.0
export var air_height = 400.0
export var gravity = 1000.0

var max_jump = 1
var jump_count = 0

var velocity = Vector2()
 
func _physics_process(delta):
	var movement = 0
	if is_on_floor():
		jump_count = 0
		
	if Input.is_action_pressed("move_right"):
		movement += 1
	if Input.is_action_pressed("move_left"):
		movement -= 1
	
	if is_on_floor():
		velocity.y = 0.0
	if Input.is_action_just_pressed("jump") and jump_count <= max_jump:
		velocity.y = -air_height
		jump_count += 1
		
	velocity.y += gravity * delta
	velocity.x = movement * move_speed
	velocity = move_and_slide(velocity, Vector2.UP)
	
