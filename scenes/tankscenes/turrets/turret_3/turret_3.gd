extends Turret

@export var fire_rate: float = 1

var can_shoot1: bool = true
var can_shoot2: bool = false

var light1: PointLight2D
var light2: PointLight2D
var RecoilAnimationPlayer1: AnimationPlayer
var RecoilAnimationPlayer2: AnimationPlayer
var MuzzleFlashAnimatedSprite1: AnimatedSprite2D
var MuzzleFlashAnimatedSprite2: AnimatedSprite2D


func _ready() -> void:
	light1 = $PointLight2D
	light2 = $PointLight2D2
	RecoilAnimationPlayer1 = $RecoilAnimationPlayer1
	RecoilAnimationPlayer2 = $RecoilAnimationPlayer2
	MuzzleFlashAnimatedSprite1 = $MuzzleFlashAnimatedSprite1
	MuzzleFlashAnimatedSprite2 = $MuzzleFlashAnimatedSprite2

	set_animations_speed(fire_rate)


func shoot() -> void:
	if can_shoot1 && bullets > 0:
		bullets -= 1
		spawn_bullet($Barrel3_1/Marker2D)
		MuzzleFlashAnimatedSprite1.play("MuzzleFlash")
		RecoilAnimationPlayer1.play("Recoil1")
		light1.enabled = true
		can_shoot1 = false

	if can_shoot2 && bullets > 0:
		bullets -= 1
		spawn_bullet($Barrel3_2/Marker2D)
		MuzzleFlashAnimatedSprite2.play("MuzzleFlash")
		RecoilAnimationPlayer2.play("Recoil2")
		light2.enabled = true
		can_shoot2 = false


func _on_muzzle_flash_animated_sprite_animation_finished() -> void:
	light1.enabled = false
	can_shoot2 = true


func _on_muzzle_flash_animated_sprite_2_animation_finished():
	light2.enabled = false
	can_shoot1 = true


func _on_recoil_animation_player_1_animation_finished(_anim_name):
#	can_shoot2 = true
	pass


func _on_recoil_animation_player_2_animation_finished(_anim_name):
#	can_shoot1 = true
	pass


func set_animations_speed(firerate) -> void:
	RecoilAnimationPlayer1.speed_scale = firerate
	RecoilAnimationPlayer2.speed_scale = firerate
	MuzzleFlashAnimatedSprite1.speed_scale = firerate
	MuzzleFlashAnimatedSprite2.speed_scale = firerate
