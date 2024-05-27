extends Control

var deadzone_size : float = 10

var clampzone_size : float = 75

var _output := Vector2.ZERO

var _touch_index = -1

onready var _base = $Base
onready var _tip = $Base/Tip

onready var _base_radius = _base.rect_size * _base.get_global_transform_with_canvas().get_scale() / 2

onready var _tip_default_position = _tip.rect_position

func _process(_delta):
	if _tip.rect_position - Vector2(50, 50) != Vector2(0, 0):
		if _tip.rect_position.x - 50 != 0:
			if _tip.rect_position.x - 50 > 0:
				get_parent().get_parent().get_parent().get_node("Player").rotation = atan((_tip.rect_position.y - 50) / (_tip.rect_position.x - 50))
			else:
				get_parent().get_parent().get_parent().get_node("Player").rotation = atan((_tip.rect_position.y - 50) / (_tip.rect_position.x - 50)) + PI
		get_parent().get_parent().get_parent().get_node("Player").shot()

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			if _is_point_inside_joystick_area(event.position) and _touch_index == -1:
				_touch_index = event.index
				_update_joystick(event.position)
		elif event.index == _touch_index:
			_reset()
			
	elif event is InputEventScreenDrag:
		if event.index == _touch_index:
			_update_joystick(event.position)

func _move_tip(new_position):
	_tip.rect_global_position = new_position - _tip.rect_pivot_offset * _base.get_global_transform_with_canvas().get_scale()

func _is_point_inside_joystick_area(point):
	var x = point.x >= rect_global_position.x and point.x <= rect_global_position.x + (rect_size.x * get_global_transform_with_canvas().get_scale().x)
	var y = point.y >= rect_global_position.y and point.y <= rect_global_position.y + (rect_size.y * get_global_transform_with_canvas().get_scale().y)
	return x and y

func _update_joystick(touch_position):
	var center = _base.rect_global_position + _base_radius
	var vector = touch_position - center
	vector = vector.clamped(clampzone_size)
	
	_move_tip(center + vector)
	
func _reset():
	_output = Vector2.ZERO
	_touch_index = -1
	_tip.rect_position = _tip_default_position
