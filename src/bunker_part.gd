extends Area2D

const MAX_DAMAGE = 3

@export var sprite: Sprite2D
#@export var texture_array: Array[Texture2D]

var damage = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.area_entered.connect(_on_area_entered)

func _on_area_entered(area) -> void:
	if area is Laser or area is InvaderShot:
		area.queue_free()
		if damage < MAX_DAMAGE:
			damage += 1
		else:
			queue_free()
	
	if area is Invader:
		queue_free()
