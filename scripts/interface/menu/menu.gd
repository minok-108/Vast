extends Control

func _on_ButtonPlay_pressed():
	global.k_position.x = 1000
	global.k_position.y = -700

func _on_Settings_pressed():
	global.k_position.x = -500
	global.k_position.y = -1200

func _on_ButtonQuit_pressed():
	get_tree().quit()

func _on_LinkButton_pressed():
	var _n_u = OS.shell_open("https://discord.gg/VUkMtmx2vP")

