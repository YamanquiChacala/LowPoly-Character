class_name CharacterBB
extends RefCounted

var _bb: Blackboard

func _init(blackboard: Blackboard) -> void:
	_bb = blackboard

var stats: CharacterStats:
	get: return _bb.get_var(&"stats")
	set(value): _bb.set_var(&"stats", value)

var input_dir: Vector2:
	get: return _bb.get_var(&"input_dir")
	set(value): _bb.set_var(&"input_dir", value)

var heading: Basis:
	get: return _bb.get_var(&"heading")
	set(value): _bb.set_var(&"heading", value)

var ground_speed: float:
	get: return _bb.get_var(&"ground_speed")
	set(value): _bb.set_var(&"ground_speed", value)
