extends Node3D
func _physics_process(delta: float) -> void:
	position.z+=0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
