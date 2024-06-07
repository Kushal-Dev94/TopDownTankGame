class_name Bullet extends Area2D


@export var bullet_speed: int = 2000
var tank_velocity: Vector2


func _ready() -> void:
	$LifeTimer.start()


func _physics_process(delta: float) -> void:
	position += (Vector2(bullet_speed, 0).rotated(rotation) + (tank_velocity.project(transform.x))) * delta

func _on_life_timer_timeout() -> void:
	self.queue_free()
