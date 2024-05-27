extends KinematicBody2D

var projection = Vector2()
var speed = 0

var a = true
var q = Vector2()

onready var timer_death = $TimerDeath

func _ready():
	randomize()
	
	if global.mode == "menu":
		rotation = rand_range(0, 360)

func _process(delta):
	
	var c = move_and_collide(projection * speed * delta)
	if c != null:
		if !c.get_collider().name.begins_with("Wall") && !c.get_collider().name.begins_with("Player"):
			c.get_collider().death()
		death()
	
	if a == false:
		if q.die == false:
			look_at(q.position)
		else:
			a = true
	
	projection.x -= (projection.x - cos(rotation)) * 0.1
	projection.y -= (projection.y - sin(rotation)) * 0.1

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


func _on_Area2D_body_entered(body):
	if a == true:
		if body.name.begins_with("Hostile1") || body.name.begins_with("@Hostile1")|| body.name.begins_with("Hostile2")|| body.name.begins_with("@Hostile2")|| body.name.begins_with("Hostile4")|| body.name.begins_with("@Hostile4")|| body.name.begins_with("Hostile5")|| body.name.begins_with("@Hostile5"):
			q = body
			a = false
