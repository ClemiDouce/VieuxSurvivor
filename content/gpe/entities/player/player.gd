class_name Player extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var projectile_spawner: SpawnerComponent = $ProjectileSpawner

var player_stat: PlayerStat

@export var speed : float = 100.
var life := 3

var current_projectile : PackedScene

func _ready() -> void:
	player_stat = PlayerStat.new()
	Global.player_stat = player_stat

func _process(delta: float) -> void:
	var direction : Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	velocity = direction * speed
	update_animation()
	
	if Input.is_action_just_pressed("TEMPORARY_shoot_proj"):
		spawn_projectile()

func _physics_process(delta: float) -> void:
	move_and_slide()

func update_animation():
	if velocity == Vector2.ZERO:
		sprite.play("idle")
		
	else:
		sprite.play("walk")
		
		if velocity.x != 0:
			sprite.flip_h = velocity.x > 0

func spawn_projectile() -> void:
	projectile_spawner.spawn()

func _on_hitbox_component_hit(hurtbox: HurtboxComponent) -> void:
	life -= hurtbox.damage
	if life <= 0:
		die()

func die():
	get_tree().reload_current_scene.call_deferred()

func gain_xp(xp_gain:float):
	printt("i gained "+ str(xp_gain) + " xp")
