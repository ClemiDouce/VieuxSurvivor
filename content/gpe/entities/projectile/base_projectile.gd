class_name BaseProjectile extends Node2D

@export var lifetime:float = 10
@export var cool_down:float = 1
@export var direction:Vector2 = Vector2.UP

@onready var life_timer:Timer = $LifeTime

var move_speed:float = 20

func _ready() -> void:
	life_timer.wait_time = lifetime
	life_timer.start()

func _physics_process(delta: float) -> void:
	translate(direction * move_speed * delta)

func _on_life_time_timeout() -> void:
	queue_free.call_deferred()
