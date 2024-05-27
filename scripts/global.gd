extends Node

var mode = "menu"

var p_position = Vector2() # p_ значит player
var k_position = Vector2() # конечная позиция камеры, к которой она стремится 

var score = 0

var destroyed = 0
var game_time = 0
var p_distance = 0

#Настройки
var music = true
var sound = true
var light = true
var particle = true
var softness = true
var fps = true
var menu_bullet = true

var file_save_best_score = File.new()
var best_score = 0

var file_save_levels = File.new()
var meaning_levels = ""

var file_save_settings = File.new()
var meaning_settings = ""

func _ready():
	if file_save_best_score.file_exists("user://save_best_score.txt") == false:
		
		file_save_best_score.open("user://save_best_score.txt", File.WRITE)
		file_save_best_score.store_string("0")
		
		file_save_best_score.close()
	
	if file_save_levels.file_exists("user://save_levels.txt") == false:
		
		file_save_levels.open("user://save_levels.txt", File.WRITE)
		file_save_levels.store_string("000000000")
		
		file_save_levels.close()
	
	if file_save_settings.file_exists("user://save_settings.txt") == false:
		
		file_save_settings.open("user://save_settings.txt", File.WRITE)
		file_save_settings.store_string("11110")
	
		file_save_settings.close()
	
	file_save_best_score.open("user://save_best_score.txt", File.READ)
	file_save_levels.open("user://save_levels.txt", File.READ)
	file_save_settings.open("user://save_settings.txt", File.READ)
	
	best_score = int(file_save_best_score.get_as_text())
	meaning_levels = file_save_levels.get_as_text()
	meaning_settings = file_save_settings.get_as_text()
	
	file_save_best_score.close()
	file_save_levels.close()
	file_save_settings.close()
	
	if meaning_settings[0] == "1":
		$GameMusic.play()
		$GameMusic.autoplay = true
	else:
		$GameMusic.stop()
		$GameMusic.autoplay = true

func save_levels():
	file_save_levels.open("user://save_levels.txt", File.WRITE)
	file_save_levels.store_string(meaning_levels)
	file_save_levels.close()

func save_settings():
	file_save_settings.open("user://save_settings.txt", File.WRITE)
	file_save_settings.store_string(meaning_settings)
	file_save_settings.close()

func game_start():
	score = 0
	destroyed = 0
	game_time = 0
	p_distance = 0
