class_name Pidgeon extends BaseEnemy

@export var move_speed: float = 75.
var target: Player
var velocity := Vector2.ZERO

func _ready() -> void:
	target = get_tree().get_first_node_in_group("player")
	
func _physics_process(delta: float) -> void:
	if target:
		var direction = self.global_position.direction_to(target.global_position)
		
		translate(direction * move_speed * delta)
		


func _on_hurtbox_component_hit_hitbox(hitbox: Variant) -> void:
	queue_free.call_deferred()


func _on_hitbox_component_hit(hurtbox: HurtboxComponent) -> void:
	die()

func die() -> void:
	spawn_xp()
	queue_free.call_deferred()
