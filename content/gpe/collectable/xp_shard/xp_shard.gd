class_name XpShard extends Area2D

var player:Player
@export var fly_speed :float = 20.
@export var xp_value :float = 1

func _physics_process(delta: float) -> void:
	if player:
		if self.global_position.distance_to(player.global_position) > 5. :
			var direction = self.global_position.direction_to(player.global_position)
			translate(direction * fly_speed * delta)
			fly_speed *= 1.03
		else:
			player.gain_xp(xp_value)
			queue_free.call_deferred()
