class_name Player
extends Area2D

@export var speed = 400

var direction = Vector2.ZERO
var bounding_size_x
var start_bound
var end_bound

@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bounding_size_x = collision_shape_2d.shape.get_rect().size.x / 2
	var rect = get_viewport().get_visible_rect()
	var camera = get_viewport().get_camera_2d()
	var camera_position = camera.position
	start_bound = (camera_position.x - rect.size.x) / 2
	end_bound = (camera_position.x + rect.size.x) / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input = Input.get_axis("ui_left", "ui_right")
	if input > 0:
		direction = Vector2.RIGHT
	elif input < 0:
		direction = Vector2.LEFT
	else:
		direction = Vector2.ZERO
	
	var delta_movement = speed * delta * direction.x
	if (
			position.x + delta_movement < start_bound + bounding_size_x * transform.get_scale().x  
			or position.x + delta_movement > end_bound - bounding_size_x * transform.get_scale().x
	): 
		return
		
	position.x += delta_movement
	#position.x = clamp(position.x + delta_movement, 60, rect.size.x - 60)


func on_player_destroyed() -> void:
	speed = 0
