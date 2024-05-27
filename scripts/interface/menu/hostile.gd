extends Sprite

var speed_rotation = rand_range(-0.005, 0.005)

func _process(_delta):
	rotation += speed_rotation
