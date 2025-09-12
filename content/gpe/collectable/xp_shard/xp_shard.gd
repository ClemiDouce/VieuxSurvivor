class_name XpShard extends Area2D

var player : Player
@export var fly_speed :float = 0.
@export var xp_value :float = 1

func _physics_process(delta: float) -> void:
	if player:
		if self.global_position.distance_to(player.global_position) > 5. :
			var direction = self.global_position.direction_to(player.global_position)
			translate(direction * (fly_speed * delta))
		else:
			player.gain_xp(xp_value)
			queue_free.call_deferred()

func set_fly_tween():
	var fly_tween = create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	fly_tween.tween_property(self, ^"fly_speed", -30, 0.1)
	fly_tween.tween_property(self, "fly_speed", 200., 0.2)

func _on_area_entered(area: Area2D) -> void:
	if player != null:
		return
	if area.get_parent() is Player:
		player = area.get_parent()
		set_fly_tween()
