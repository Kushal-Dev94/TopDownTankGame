extends Camera2D

var target_zoom: Vector2 = Vector2(1, 1)
var target_offset: Vector2 = Vector2(0, 0)
var zoom_amount: float = 0.05
var max_zoom: Vector2 = Vector2(1, 1)
var min_zoom: Vector2 = Vector2(0.2, 0.2)


func _physics_process(_delta: float) -> void:
	input()

	target_zoom = clamp(target_zoom, min_zoom, max_zoom)
	zoom = lerp(zoom, target_zoom, 0.1)

	offset = lerp(offset, target_offset, 0.1)


func input() -> void:
	if Input.is_action_just_released("MouseWheelDown"):
		target_zoom -= Vector2(0.1, 0.1)
	if Input.is_action_just_released("MouseWheelUp"):
		target_zoom += Vector2(0.1, 0.1)

	if Input.is_action_pressed("RightClick"):
		target_offset = get_global_mouse_position() - get_screen_center_position()
	else:
		target_offset = Vector2(0, 0)
