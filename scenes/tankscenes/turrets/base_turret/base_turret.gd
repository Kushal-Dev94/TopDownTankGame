class_name Turret extends Sprite2D

@export var max_bullets: int = 1000
@export var bullets: int = 750
@export var bullet_scene: PackedScene

var tank_velocity: Vector2


func shoot() -> void:
	pass


func spawn_bullet(location: Marker2D) -> void:
	var bullet_instance = bullet_scene.instantiate()
	get_tree().get_root().add_child(bullet_instance)
	bullet_instance.global_position = location.global_position
	bullet_instance.global_rotation = location.global_rotation
	bullet_instance.tank_velocity = tank_velocity
