class_name SpawnTimer
extends Timer

@export var min_time = 5
@export var max_time = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup_timer()


func setup_timer() -> void:
	var random_time = randi_range(min_time, max_time)
	self.wait_time = random_time
	self.stop()
	self.start()
