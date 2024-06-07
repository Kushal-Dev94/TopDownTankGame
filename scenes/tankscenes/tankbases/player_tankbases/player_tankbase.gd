extends BaseTank


func input() -> void:
	if Input.is_action_pressed("W"):
		apply_forward_force()
	if Input.is_action_pressed("S"):
		apply_backward_force()
		
	if Input.is_action_pressed("A"):
		apply_anticlockwise_torque()
	if Input.is_action_pressed("D"):
		apply_clockwise_torque()

	if Input.is_action_pressed("LeftClick"):
		shoot()


	current_turret_node.look_at(get_global_mouse_position())
