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
	var heading := bb.heading
	
	var direction := heading * Vector3(input_dir.x, 0, -input_dir.y)
	direction.y = 0
	direction = direction.normalized()
	
	if direction:
		character.velocity = character.velocity.lerp(direction * max_speed, 1-exp(-accel * delta))
	else:
		character.velocity = character.velocity.lerp(Vector3.ZERO, 1-exp(-decel * delta))
		
	character.move_and_slide()
	
	bb.ground_speed = character.velocity.length() / max_speed
