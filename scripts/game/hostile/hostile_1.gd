extends KinematicBody2D

var speed_rotation = rand_range(-0.005, 0.005)

var die = false

onready var timer_spawn_bullet = $TimerSpawnBullet
onready var timer_death = $TimerDeath

func _ready():
	rotation = rand_range(-PI, PI)
	scale.x = rand_range(0.08, 0.1)
	scale.y = scale.x
	
	timer_spawn_bullet.set_wait_time(3)
	timer_spawn_bullet.start()

func _process(_delta):
	rotation += speed_rotation

func _on_TimerSpawnBullet_timeout():
	for i in range(2):
		get_parent().get_parent().get_node("SpawnerBullet").shot_hostile_2_5(position, rotation + PI * i, 300, 34 * 10 * scale.x, "hostile_1")

func death():
	global.destroyed += 1
	
	timer_spawn_bullet.stop()
	
	if global.particle == false:
		queue_free()
	
	die = true
	
	$Sprite.queue_free()
	$Collision.queue_free()
	$Particle.restart()
	
	timer_death.set_wait_time(3)
	timer_death.start()

func _on_TimerDeath_timeout():
	queue_free()
