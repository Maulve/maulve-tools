@tool
## A Node to shake a Camera2D
extends Node
class_name CameraShake2D

## (optional) select the camera to apply the affect to. Will use the parent if not present.
@export var camera: Camera2D

var initial_offset: Vector2 = Vector2()

var is_active: bool = false

var current_intensity: float = 1
var recover_time: float = 0.3


signal started_shake
signal ended_shake


func _ready():
	set_physics_process(false)
	
	if camera == null and get_parent() is Camera2D:
		camera = get_parent()
	elif camera == null:
		printerr("Maulve Tools: CameraShake2D camera variable could not be set.")
	
	initial_offset = camera.offset
	

# just manages shake, not actual shake
## Shake a camera with a specific intensity and duration
func shake(intensity: float = 1, duration: float = 0.5):
	set_physics_process(true)
	is_active = true
	
	current_intensity = intensity
	
	started_shake.emit()
	
	# creates a Timer to wait for timeout, then stops shake
	# This needs to be a Timer node to run async
	var timer: Timer = Timer.new()
	
	timer.wait_time = duration
	timer.one_shot = true
	
	add_child(timer)
	timer.start()
	
	timer.timeout.connect(func():
		_end_shake()
		timer.queue_free())

# the actual shake
func _physics_process(_delta: float) -> void:
	camera.offset = Vector2(randf_range(0.1, current_intensity), randf_range(0.1, current_intensity))


func _end_shake():
	set_physics_process(false)
	is_active = false
	
	var tween = create_tween()
	tween.tween_property(camera, "offset", initial_offset, recover_time)
	await tween.finished
	
	ended_shake.emit()
	
