extends Node2D

var s_player_bullet = load("res://nodes/game/player/Bullet.tscn")
var s_hostile_bullet_1_2_5 = load("res://nodes/game/hostile/Bullet125.tscn")
var s_hostile_bullet_4 = load("res://nodes/game/hostile/Bullet4.tscn")

func shot_player(pos, rot, s, ots):
	var bullet = s_player_bullet.instance()
	
	add_child(bullet)
	
	bullet.speed = s
	
	bullet.rotation = rot
	bullet.projection.x = cos(rot)
	bullet.projection.y = sin(rot)
	bullet.position.x = pos.x + ots * cos(rot)
	bullet.position.y = pos.y + ots * sin(rot)

func shot_hostile_2_5(pos, rot, s, ots, type):
	var bullet = s_hostile_bullet_1_2_5.instance()
	
	add_child(bullet)
	
	bullet.speed = s
	
	bullet.projection.x = cos(rot)
	bullet.projection.y = sin(rot)
	bullet.position.x = pos.x + ots * cos(rot)
	bullet.position.y = pos.y + ots * sin(rot)
	
	if type == "hostile_1":
		bullet.get_node("Sprite").play("hostile_1")
		bullet.get_node("Particle").color = Color(1, 0.4, 0)
	if type == "hostile_2":
		bullet.get_node("Sprite").play("hostile_2")
		bullet.get_node("Particle").color = Color(1, 0, 0)
	if type == "hostile_5":
		bullet.get_node("Sprite").play("hostile_5")
		bullet.get_node("Particle").color = Color(0.5, 0, 0.5)

func shot_hostile_4(pos, rot, s, ots):
	var bullet = s_hostile_bullet_4.instance()
	
	add_child(bullet)
	
	bullet.speed = s
	
	bullet.projection.x = cos(rot)
	bullet.projection.y = sin(rot)
	bullet.position.x = pos.x + ots * cos(rot)
	bullet.position.y = pos.y + ots * sin(rot)
