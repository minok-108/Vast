extends KinematicBody2D

var heath = 5
onready var timer_death = $TimerDeath

func _ready():
	scale.x = rand_range(0.08, 0.1)
	scale.y = scale.x

func death():
	global.destroyed += 1
	
	if global.particle == false:
		queue_free()
	
	$Sprite.queue_free()
	$Collision.queue_free()
	$Particle.restart()
	
	timer_death.set_wait_time(3)
	timer_death.start()

func _on_TimerDeath_timeout():
	queue_free()

 
