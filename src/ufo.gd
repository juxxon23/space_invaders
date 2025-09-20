class_name UFO
extends Area2D

@export var speed = 200

@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var shooting_point: Node2D = %ShootingPoint



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= delta * speed


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is Laser:
		shooting_point.queue_free()
		queue_free()
		
