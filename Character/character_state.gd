class_name CharacterState
extends LimboState

var character: Character
var bb: CharacterBB


func _setup() -> void:
	character = agent as Character
	bb = CharacterBB.new(blackboard)
