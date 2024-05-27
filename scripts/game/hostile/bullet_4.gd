extends KinematicBody2D

var projection = Vector2()
var speed = 350

onready var timer_death = $TimerDeath

func _process(delta):
	look_at(global.p_position)
	
	projection.x -= (projection.x - cos(rotation)) * 0.015
	projection.y -= (projection.y - sin(rotation)) * 0.015
	
	var c = move_and_collide(projection * speed * delta)
	if c != null:
		if c.get_collider().name.begins_with("Bullet") || c.get_collider().name.begins_with("@Bullet") || c.get_collider().name.begins_with("Player"):
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
