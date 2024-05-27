extends Camera2D

func _ready():
	global.k_position.x = 0
	global.k_position.y = 0

func _process(_delta):
	
	if global.softness == true:
		position.x -= (position.x - global.k_position.x) * 0.07
		position.y -= (position.y - global.k_position.y) * 0.07
		
	else:
		position = global.k_position
	
	if global.fps == true:
		if get_node_or_null("FPS"):
			$FPS.text = "FPS: " + str(Engine.get_frames_per_second())
	
	if get_node_or_null("Score"):
		match global.mode:
			"infinite":
				$Score.text = "score: " + str(global.score)
			"level_1":
				$Score.text = "destroyed: " + str(global.destroyed)
			"level_2":
				$Score.text = "time: " + str(global.game_time)
			"level_3":
				$Score.text = "time: " + str(global.game_time)
			"level_4":
				$Score.text = "distance: " + str(int(global.p_distance))
			"level_5":
				$Score.text = "destroyed: " + str(global.destroyed)
			"level_6":
				$Score.text = "time: " + str(global.game_time)
			"level_7":
				$Score.text = "destroyed: " + str(global.destroyed)
			"level_8":
				$Score.text = "time: " + str(global.game_time)
			"level_9":
				$Score.text = "destroyed: " + str(global.destroyed)

func _on_ButtonAgain_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	get_tree().paused = false
	global.game_start()
	var _n_u = get_tree().change_scene("res://nodes/game/Game.tscn")

func _on_ButtonContinue_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	$Paused.visible = false
	get_tree().paused = false

func _on_ButtonMenu_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	var _n_v = get_tree().change_scene("res://nodes/interface/Beginning.tscn")
	global.mode = "menu"
	get_tree().paused = false

func _on_ButtonPause_pressed():
	if global.sound == true:
		global.get_node("Pause").play()
	
	$Paused.visible = !$Paused.visible
	get_tree().paused = !get_tree().paused
