class_name CharacterState
extends LimboState

var character: CharacterBody3D
var bb: CharacterBB


func _setup() -> void:
	character = agent as CharacterBody3D
	bb = CharacterBB.new(blackboard)
