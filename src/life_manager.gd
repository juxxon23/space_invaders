class_name LifeManager
extends Node

signal life_lost(lifes_left: int)

const player_scene = preload("res://scenes/player.tscn")

@export var lifes = 3

@onready var player: Player = %Player as Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.player_destroyed.connect(on_player_destroyed)


func on_player_destroyed() -> void:
	lifes -= 1
	life_lost.emit(lifes)
	if lifes != 0:
		player = player_scene.instantiate() as Player
		player.global_position = Vector2(0, 295)
		player.player_destroyed.connect(on_player_destroyed)
		get_tree().root.get_node("Main").add_child(player)
	
