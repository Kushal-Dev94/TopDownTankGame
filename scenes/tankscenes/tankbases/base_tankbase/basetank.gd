class_name BaseTank extends RigidBody2D

@export var health: int = 100
@export var force: int = 80
@export var torque: float = 4000
@export var vertical_drag: float = 0.03
@export var horizontal_drag: float = 0.2
@export var blur_strength: float = 0.5

@export var current_turret_path: NodePath
@export var trackleft_path: NodePath
@export var trackright_path: NodePath

var current_turret_node: Turret
var trackleft_node: Track
var trackright_node: Track

var vertical_velocity: Vector2
var horizontal_velocity: Vector2
var bullet_speed: float


func _ready() -> void:
	current_turret_node = get_node(current_turret_path)
	trackleft_node = get_node(trackleft_path)
	trackright_node = get_node(trackright_path)


func _physics_process(_delta: float) -> void:
	calculate_velocities()
	apply_drags()
	input()
	set_tracks()
	set_turrets()


func calculate_velocities() -> void:
	vertical_velocity = linear_velocity.project(transform.x)
	horizontal_velocity = linear_velocity.project(transform.y)


func apply_drags() -> void:
	apply_central_impulse(-horizontal_velocity * horizontal_drag * mass)
	apply_central_impulse(-vertical_velocity * vertical_drag * mass)


func input() -> void:
	pass


func set_tracks() -> void:
	trackleft_node.tank_vertical_velocity = vertical_velocity
	
	trackright_node.tank_vertical_velocity = vertical_velocity
	
	trackleft_node.track_rotation_speed = angular_velocity * 0.7
	trackright_node.track_rotation_speed = -angular_velocity * 0.7


func set_turrets() -> void:
	current_turret_node.tank_velocity = linear_velocity


func shoot() -> void:
	current_turret_node.shoot()


func apply_anticlockwise_torque() -> void:
	apply_torque_impulse(-torque)


func apply_clockwise_torque() -> void:
	apply_torque_impulse(torque)


func apply_forward_force() -> void:
	apply_central_force(transform.x * force * 60)


func apply_backward_force() -> void:
	apply_central_force(transform.x * -force * 60)
