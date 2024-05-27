extends Control

func _ready():
	if global.meaning_settings[0] == "1":
		$GridContainer/Music/ButtonMusic.pressed = true
		global.music = true
	else:
		$GridContainer/Music/ButtonMusic.pressed = false
		global.music = false
	
	if global.meaning_settings[1] == "1":
		$GridContainer/Sound/ButtonSound.pressed = true
		global.sound = true
	else:
		$GridContainer/Sound/ButtonSound.pressed = false
		global.sound = false
	
	if global.meaning_settings[2] == "1":
		$GridContainer/Particle/ButtonParticle.pressed = true
		global.particle = true
	else:
		$GridContainer/Particle/ButtonParticle.pressed = false
		global.particle = false
	
	if global.meaning_settings[3] == "1":
		$GridContainer/Softness/ButtonSoftness.pressed = true
		global.softness = true
	else:
		$GridContainer/Softness/ButtonSoftness.pressed = false
		global.softness = false
	
	if global.meaning_settings[4] == "1":
		$GridContainer/FPS/ButtonFPS.pressed = true
		global.fps = true
	else:
		$GridContainer/FPS/ButtonFPS.pressed = false
		global.fps = false

func _on_ButtonMusic_pressed():
	global.music = settings(0)
	if global.music == true:
		get_parent().get_parent().get_node("global/GameMusic").play()
	else:
		get_parent().get_parent().get_node("global/GameMusic").stop()

func _on_ButtonSound_pressed():
	global.sound = settings(1)
	
	if global.sound == true:
		global.get_node("ButtonPressed").play()

func _on_ButtonParticle_pressed():
	global.particle = settings(2)

func _on_ButtonSoftness_pressed():
	global.softness = settings(3)

func _on_ButtonFPS_pressed():
	global.fps = settings(4)

func settings(number_settings):
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	if global.meaning_settings[number_settings] == "1":
		global.meaning_settings[number_settings] = "0"
		
		global.save_settings()
		
		return false
	
	else:
		global.meaning_settings[number_settings] = "1"
		
		global.save_settings()
		
		return true

func _on_ButtonBack_pressed():
	if global.sound == true:
		global.get_node("ButtonPressed").play()
	
	global.k_position.x = 0
	global.k_position.y = 0
