extends Turret

var light: PointLight2D
var can_shoot: bool = true


func _ready() -> void:
	light = $PointLight2D


func shoot() -> void:
	if can_shoot && bullets > 0:
		bullets -= 1
		spawn_bullet($Barrel_1/Marker2D)
		$RecoilAnimationPlayer.play("Recoil")
		$MuzzleFlashAnimatedSprite.play("MuzzleFlash")
		light.enabled = true
		can_shoot = false


func _on_recoil_animation_player_animation_finished(_anim_name):
	can_shoot = true


func _on_muzzle_flash_animated_sprite_animation_finished():
	light.enabled = false
