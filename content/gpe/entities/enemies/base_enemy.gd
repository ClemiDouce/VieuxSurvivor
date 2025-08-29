class_name BaseEnemy extends Node2D

@onready var spawner_component: SpawnerComponent = $XpSpawner

func spawn_xp() -> void:
	spawner_component.spawn()
