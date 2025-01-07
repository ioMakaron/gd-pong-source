extends Control



func _process(delta: float) -> void:
	$Stats.text = str("fps:",Engine.get_frames_per_second() ,"\n(m) to mute audio")
	$HBoxContainer/player_score.text = str(Core.player_score)
	$HBoxContainer/enemy_score.text = str(Core.enemy_score)
