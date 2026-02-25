class_name Character
extends CharacterBody3D

@export var stats: CharacterStats

@onready var state_machine: LimboHSM = $LimboHSM
@onready var animation_tree: AnimationTree = $AnimationTree

var char_bb: CharacterBB

func _ready() -> void:
	char_bb = CharacterBB.new(state_machine.blackboard)
	char_bb.stats = stats
	
	state_machine.initialize(self)
	state_machine.set_active(true)


func _physics_process(_delta: float) -> void:
	char_bb.input_dir = Input.get_vector(&"left",&"right",&"back",&"forward")
