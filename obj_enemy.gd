extends CharacterBody2D


const SPEED = 300.0





func _physics_process(delta: float) -> void:
	# Add the gravity.

	# Handle jump.
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	self.position.y = Core.ball_y

	move_and_slide()
