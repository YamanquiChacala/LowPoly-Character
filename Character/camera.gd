class_name Camera
extends Node3D

const ANGLE_LIMIT = 1.0
const MOUSE_SENSITIVITY = 0.003

@export var height := 1.70
@export var distance := 3.0

@onready var arm: SpringArm3D = $SpringArm3D
@onready var camera: Camera3D = $SpringArm3D/Camera3D


func _ready() -> void:
	arm.position.y = height
	arm.spring_length = distance


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"pause"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		var mouse_event := event as InputEventMouseMotion
		rotation.y -= mouse_event.relative.x * MOUSE_SENSITIVITY
		arm.rotation.x -= mouse_event.relative.y * MOUSE_SENSITIVITY
		arm.rotation.x = clampf(arm.rotation.x, -ANGLE_LIMIT, ANGLE_LIMIT)
