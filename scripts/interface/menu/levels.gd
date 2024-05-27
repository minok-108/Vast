extends Control

var selected_level = ""

onready var timer = $Timer

func _ready():
	if global.meaning_levels[0] == "1":
		$GridContainer/ButtonLevel1/Sprite.visible = true
	else:
		$GridContainer/ButtonLevel1/Sprite.visible = false
	
	if global.meaning_levels[1] == "1":
		$GridContainer/ButtonLevel2/Sprite.visible = true
	else:
		$GridContainer/ButtonLevel2/Sprite.visible = false
	
	if global.meaning_levels[2] == "1":
		$GridContainer/ButtonLevel3/Sprite.visible = true
	else:
		$GridContainer/ButtonLevel3/Sprite.visible = false
	
	if global.meaning_levels[3] == "1":
		$GridContainer/ButtonLevel4/Sprite.visible = true
	else:
		$GridContainer/ButtonLevel4/Sprite.visible = false
	
	if global.meaning_levels[4] == "1":
		$GridContainer/ButtonLevel5/Sprite.visible = true
	else:
		$GridContainer/ButtonLevel5/Sprite.visible = false
	
	if global.meaning_levels[5] == "1":
		$GridContainer/ButtonLevel6/Sprite.visible = true
	else:
		$GridContainer/ButtonLevel6/Sprite.visible = false
	
	if global.meaning_levels[6] == "1":
		$GridContainer/ButtonLevel7/Sprite.visible = true
	else:
		$GridContainer/ButtonLevel7/Sprite.visible = false
	
	if global.meaning_levels[7] == "1":
		$GridContainer/ButtonLevel8/Sprite.visible = true
	else:
		$GridContainer/ButtonLevel8/Sprite.visible = false
	
	if global.meaning_levels[8] == "1":
		$GridContainer/ButtonLevel9/Sprite.visible = true
	else:
		$GridContainer/ButtonLevel9/Sprite.visible = false

func _on_ButtonInfinite_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	selected_level = "infinite"
	$Goal.updatee(selected_level)

func _on_ButtonLevel1_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	selected_level = "level_1"
	$Goal.updatee(selected_level)

func _on_ButtonLevel2_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	selected_level = "level_2"
	$Goal.updatee(selected_level)

func _on_ButtonLevel3_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	selected_level = "level_3"
	$Goal.updatee(selected_level)

func _on_ButtonLevel4_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	selected_level = "level_4"
	$Goal.updatee(selected_level)

func _on_ButtonLevel5_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	selected_level = "level_5"
	$Goal.updatee(selected_level)

func _on_ButtonLevel6_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	selected_level = "level_6"
	$Goal.updatee(selected_level)

func _on_ButtonLevel7_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	selected_level = "level_7"
	$Goal.updatee(selected_level)

func _on_ButtonLevel8_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	selected_level = "level_8"
	$Goal.updatee(selected_level)

func _on_ButtonLevel9_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	selected_level = "level_9"
	$Goal.updatee(selected_level)

func _on_ButtonGo_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	global.k_position.x = 1500
	global.k_position.y = -1600
	
	global.mode = selected_level
	global.game_start()
	
	timer.start()

func _on_Timer_timeout():
	timer.stop()
	var _n_u = get_tree().change_scene("res://nodes/game/Game.tscn")

func _on_ButtonBack_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	global.k_position.x = 0
	global.k_position.y = 0
