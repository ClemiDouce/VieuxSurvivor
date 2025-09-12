class_name HurtboxComponent
extends Area2D

@export var damage = 1.0
@export var max_collision = 1

signal hit_hitbox(hitbox)

func _ready():
	area_entered.connect(_on_hitbox_entered)

func _on_hitbox_entered(hitbox: HitboxComponent):
	if max_collision <= 0:
		return
	# Make sure the area we are overlapping is a hurtbox
	if not hitbox is HitboxComponent: return
	# Make sure the hitbox isn't invincible
	if hitbox.is_invincible: return
	# Signal out that we hit a hitbox (this is useful for destroying projectiles when they hit something)
	hit_hitbox.emit(hitbox)
	# Have the hitbox signal out that it was hit
	hitbox.hit.emit(self)
	max_collision -= 1
