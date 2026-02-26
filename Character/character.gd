class_name Character
extends CharacterBody3D

const GROUND_SPEED = ^"parameters/ground_speed/blend_amount"

@export var stats: CharacterStats

@onready var state_machine: LimboHSM = $LimboHSM
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var camera: Camera = $Camera
@onready var mesh: Node3D = $"Characterr rig"

var char_bb: CharacterBB


func _ready() -> void:
	char_bb = CharacterBB.new(state_machine.blackboard)
	char_bb.stats = stats
	char_bb.input_dir = Vector2.ZERO
	char_bb.heading = Basis.IDENTITY
	char_bb.ground_speed = 0.0
	
	state_machine.initialize(self)
	state_machine.set_active(true)


func _process(delta: float) -> void:
	char_bb.input_dir = Input.get_vector(&"left",&"right",&"back",&"forward")
	char_bb.heading = camera.basis
	
	var target_mesh_yaw := atan2(velocity.x, velocity.z)
	mesh.rotation.y = lerp_angle(mesh.rotation.y, target_mesh_yaw, 1-exp(-stats.rotation_acceleration * delta))
	
	animation_tree.set_indexed(GROUND_SPEED, char_bb.ground_speed)
