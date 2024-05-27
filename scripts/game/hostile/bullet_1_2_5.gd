extends KinematicBody2D

var projection = Vector2()
var speed = 0

onready var timer_death = $TimerDeath

func _process(delta):
	var c = move_and_collide(projection * speed * delta)
	if c != null:
		if c.get_collider().name.begins_with("Bullet")|| c.get_collider().name.begins_with("@Bullet") || c.get_collider().name.begins_with("Player"):
			c.get_collider().death()
		death()

func death():
	if global.particle == false:
		queue_free()
	
	speed = 0
	$Sprite.queue_free()
	$Collision.queue_free()
	$Particle.restart()
	timer_death.set_wait_time(3)
	timer_death.start()

func _on_TimerDeath_timeout():
	queue_free()
