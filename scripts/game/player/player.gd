extends KinematicBody2D

var speed = Vector2()
var recharge_finish = true #Окончена ли перезардка?
var recharge = 0.45 #Перезарядка

onready var timer_recharge = $Recharge

func _ready():
	timer_recharge.set_wait_time(recharge)

func _process(delta):
	var delta_coord = Vector2()
	
	global.p_position = position
	global.k_position = position
	
	delta_coord.x -= (delta_coord.x - speed.x) * 0.05 #Плавное движение
	delta_coord.y -= (delta_coord.y - speed.y) * 0.05
	speed.x -= delta_coord.x
	speed.y -= delta_coord.y
	
	#####################
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("mouse_left"):
		shot()
	
	if Input.is_action_pressed("W"):
		speed.y -= 1000
	
	if Input.is_action_pressed("S"):
		speed.y += 1000
	
	if Input.is_action_pressed("A"):
		speed.x -= 1000
	
	if Input.is_action_pressed("D"):
		speed.x += 1000
	#############################
	
	delta_coord = speed
	
	var p_speed = move_and_slide(delta_coord * delta)
	
	global.p_distance += pow(pow(p_speed.x * delta, 2) + pow(p_speed.y * delta, 2), 0.5)
	
	var c = get_last_slide_collision()
	if c != null:
		if c.get_collider().name.begins_with("BulletHostile125") || c.get_collider().name.begins_with("@BulletHostile125") || c.get_collider().name.begins_with("BulletHostile4") || c.get_collider().name.begins_with("@BulletHostile4"):
			death()

func shot():
	if recharge_finish == true:
		get_parent().get_node("SpawnerBullet").shot_player(position, rotation, 500, 29)
		recharge_finish = false
		timer_recharge.start()

func  _on_Recharge_timeout():
	recharge_finish = true
	timer_recharge.stop()

func death():
	get_parent().get_node("Camera/Lose").visible = true #Сигнал для воспроязвидения поигрышной сцены
	get_tree().paused = true
