extends Camera3D
@onready var camera: Camera3D = $"."

@onready var scary_terry_left: Node3D = $"../SCARY TERRY LEFT"
@onready var scary_terry_right: Node3D = $"../SCARY TERRY RIGHT"
@onready var spot_light_3d: SpotLight3D = $"../SpotLight3D"

func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		rotation.y+=3*delta
	if Input.is_action_pressed("right"):
		rotation.y-=3*delta
