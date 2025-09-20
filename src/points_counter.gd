class_name PointsCounter
extends Node

signal on_points_increased(points: int)

var points = 0

@onready var invader_spawner: InvaderSpawner = %InvaderSpawner as InvaderSpawner

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	invader_spawner.invader_destroyed.connect(increase_points)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func increase_points(points_to_add: int) -> void:
	points += points_to_add
	on_points_increased.emit(points)
	print(points)
