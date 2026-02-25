extends CharacterState

var max_speed: float
var accel: float
var decel: float

func _enter() -> void:
	max_speed = bb.stats.max_run_speed
	accel = bb.stats.acceleration
	decel = bb.stats.deceleration

func _update(delta: float) -> void:
	var input_dir := bb.input_dir
	var movement_dir := Vector3(input_dir.x, 0, input_dir.y)
	var target_vel := movement_dir * max_speed
	
	character.velocity = character.velocity.lerp(target_vel, 1-exp(-accel * delta))
	character.move_and_slide()
