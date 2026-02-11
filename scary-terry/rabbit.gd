extends Node3D
func _physics_process(delta: float) -> void:
	position.z+=60*delta
