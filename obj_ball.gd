extends CharacterBody2D
@onready var fx: AudioStreamPlayer2D = $FX




const SPEED = 300.0
var direction= Vector2.ZERO
func _ready() -> void:

	
	self.position = Vector2(DisplayServer.window_get_size().x /2,DisplayServer.window_get_size().y /2 )
	var rand = Vector2(randi_range(-1,1),randi_range(-1,1))
	if rand.x != 0:
		direction = rand
	else:
		rand = Vector2(randi_range(1,1),randi_range(-1,1))
func _physics_process(delta: float) -> void:
	
	Core.ball_y = self.position.y
	if direction == Vector2.ZERO:
		direction = Vector2(randi_range(1,1),randi_range(-1,1))

	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y*SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
	

func _play_sound():
	if Core.audio == true:
		if !fx.playing:
			fx.play()



func _on_area_up_body_entered(body: Node2D) -> void:
	if body.name == "worldBorder":
		direction.y = -direction.y
	if body.name == "objPlayer":
		direction.y = -direction.y
	_play_sound()

func _on_area_down_body_entered(body: Node2D) -> void:
	if body.name == "worldBorder":
		direction.y = -direction.y
	if body.name == "objPlayer":
		direction.y = -direction.y
	_play_sound()
func _on_area_left_body_entered(body: Node2D) -> void:
	if body.name == "worldBorder":
		direction.x = -direction.x
	if body.name == "objPlayer":
		direction.x = -direction.x
		direction.y = direction.y + Core.input
		_play_sound()
func _on_area_right_body_entered(body: Node2D) -> void:
	if body.name == "worldBorder":
		direction.x = -direction.x
	if body.name == "objPlayer":
		direction.x = -direction.x
	if body.name == "objEnemy":
		direction.x = -direction.x
	_play_sound()

func _on_area_left_area_entered(area: Area2D) -> void:
	if area.name == "PlayerSide":
		direction = direction / direction
		Core.enemy_score +=1
		self.position = Vector2(DisplayServer.window_get_size().x /2,DisplayServer.window_get_size().y /2 )
		direction.x = -direction.x

func _on_area_right_area_entered(area: Area2D) -> void:
	if area.name == "EnemySide":
		direction.x = direction.x / direction.x
		Core.player_score +=1
		self.position = Vector2(DisplayServer.window_get_size().x /2,DisplayServer.window_get_size().y /2 )
		direction.x = -direction.x
