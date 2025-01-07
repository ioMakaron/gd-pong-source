extends Node2D



func _ready() -> void:
	$objPlayer.position = Vector2(45,DisplayServer.window_get_size().y/2)
	$objEnemy.position = Vector2(DisplayServer.window_get_size().x - 45,DisplayServer.window_get_size().y/2)
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mute"):
		Core.audio = !Core.audio
