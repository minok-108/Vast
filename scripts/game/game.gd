extends Node2D

onready var timer = $Timer

func _ready():
	timer.start()

func _on_Timer_timeout():
	global.game_time += 0.1

func _input(event):
	if event.is_action_pressed("ESC") && global.mode != "menu"  && get_node("Camera/Lose").visible == false:
		if global.sound == true:
			$Pause.play()
		$Camera/Paused.visible = !$Camera/Paused.visible
		get_tree().paused = !get_tree().paused

func _process(_delta):
	match global.mode:
		"infinite":
			pass
		"level_1":
			if global.destroyed >= 10:
				win(0)
		"level_2":
			if global.game_time >= 20:
				win(1)
		"level_3":
			if global.game_time >= 20:
				win(2)
			if global.destroyed >= 1:
				$Player.death()
		"level_4":
			if global.p_distance >= 10000:
				win(3)
		"level_5":
			if global.destroyed >= 40:
				win(4)
		"level_6":
			if global.game_time >= 45:
				win(5)
		"level_7":
			if global.destroyed >= 35:
				win(6)
		"level_8":
			if global.game_time >= 40:
				win(7)
		"level_9":
			if global.destroyed >= 50:
				win(8)

func win(number_levels):
	$Camera/Win.visible = true

	global.meaning_levels[number_levels] = "1"
	global.save_levels()
