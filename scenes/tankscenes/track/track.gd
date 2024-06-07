class_name Track extends Sprite2D

var animationplayer: AnimationPlayer
var track_speed: float
var track_rotation_speed: float

var tank_vertical_velocity: Vector2


func _ready() -> void:
	animationplayer = get_node("AnimationPlayer")
	animationplayer.play("track_move")


func _physics_process(_delta: float) -> void:
	# 1/250 = 0.004 (250 pixels per second is the speed of "track_move" animation)
	track_speed = (tank_vertical_velocity * 0.004).project(global_transform.x.normalized()).length()
	animationplayer.speed_scale = track_speed + track_rotation_speed
