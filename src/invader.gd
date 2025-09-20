class_name Invader
extends Area2D

var config: Resource

@onready var sprite_2d: Sprite2D = %Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.texture = config.sprite


func _on_area_entered(area: Area2D) -> void:
	if area is Laser:
		area.queue_free()
		queue_free()
