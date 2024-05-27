extends Node2D

var s_hostile_1 = load("res://nodes/game/hostile/Hostile1.tscn")
var s_hostile_2 = load("res://nodes/game/hostile/Hostile2.tscn")
var s_hostile_3 = load("res://nodes/game/hostile/Hostile3.tscn")
var s_hostile_4 = load("res://nodes/game/hostile/Hostile4.tscn")
var s_hostile_5 = load("res://nodes/game/hostile/Hostile5.tscn")
var time_spawn = 2

onready var timer = $Timer

func _ready():
	randomize()
	timer.set_wait_time(time_spawn)
	timer.start()

func _on_Timer_timeout():
	if time_spawn > 0.4:
		time_spawn -= 0.002
		timer.set_wait_time(time_spawn)
	
	if global.mode == "infinite":
		if global.score >= 25 && global.score % 6 == 0:
			var hostile_2 = s_hostile_2.instance()
			add_child(hostile_2)
			hostile_2.position = spawner()
		
		elif global.score >= 50 && global.score % 7 == 0:
			var hostile_3 = s_hostile_3.instance()
			add_child(hostile_3)
			hostile_3.position = spawner()
		
		elif global.score >= 75 && global.score % 13 == 0:
			var hostile_4 = s_hostile_4.instance()
			add_child(hostile_4)
			hostile_4.position = spawner()
		
		elif global.score >= 100 && global.score % 9 == 0:
			var hostile_5 = s_hostile_5.instance()
			add_child(hostile_5)
			hostile_5.position = spawner()
		
		else:
			var hostile_1 = s_hostile_1.instance()
			add_child(hostile_1)
			hostile_1.position = spawner()
		
		global.score += 1
	
		if global.best_score < global.score:
			global.best_score = global.score
			global.file_save_best_score.open("user://save_best_score.txt", File.WRITE)
			global.file_save_best_score.store_string(str(global.best_score))
			global.file_save_best_score.close()
		
	elif global.mode == "level_1" || global.mode == "level_3":
		var hostile_1 = s_hostile_1.instance()
		add_child(hostile_1)
		hostile_1.position = spawner()
	
	elif global.mode == "level_2":
		var hostile_2 = s_hostile_2.instance()
		add_child(hostile_2)
		hostile_2.position = spawner()
	
	elif global.mode == "level_4":
		var hostile_1 = s_hostile_1.instance()
		add_child(hostile_1)
		hostile_1.position = spawner()
		
		var hostile_2 = s_hostile_2.instance()
		add_child(hostile_2)
		hostile_2.position = spawner()
	
	elif global.mode == "level_5":
		for _i in range(2):
			var hostile_2 = s_hostile_2.instance()
			add_child(hostile_2)
			hostile_2.position = spawner()
		
		var hostile_3 = s_hostile_3.instance()
		add_child(hostile_3)
		hostile_3.position = spawner()
	
	elif global.mode == "level_6":
		var hostile_3 = s_hostile_3.instance()
		add_child(hostile_3)
		hostile_3.position = spawner()
		
		var hostile_4 = s_hostile_4.instance()
		add_child(hostile_4)
		hostile_4.position = spawner()
	
	elif global.mode == "level_7":
		var hostile_4 = s_hostile_4.instance()
		add_child(hostile_4)
		hostile_4.position = spawner()
		
	elif global.mode == "level_8":
		var hostile_2 = s_hostile_2.instance()
		add_child(hostile_2)
		hostile_2.position = spawner()
		
		var hostile_5 = s_hostile_5.instance()
		add_child(hostile_5)
		hostile_5.position = spawner()
	
	elif global.mode == "level_9":
		var hostile_4 = s_hostile_4.instance()
		add_child(hostile_4)
		hostile_4.position = spawner()
		
		var hostile_5 = s_hostile_5.instance()
		add_child(hostile_5)
		hostile_5.position = spawner()
		
	else:
		pass

func spawner():
	var prob_position = global.p_position
	while pow(pow(prob_position.x - global.p_position.x, 2) + pow(prob_position.y - global.p_position.y, 2), 0.5) < 60:
		prob_position.x = rand_range(50, 1450)
		prob_position.y = rand_range(50, 1450)
	return prob_position
