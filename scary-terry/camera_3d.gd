extends Camera3D
@onready var camera: Camera3D = $"."

@onready var scary_terry_left: Node3D = $"../SCARY TERRY LEFT"
@onready var scary_terry_right: Node3D = $"../SCARY TERRY RIGHT"
@onready var spot_light_3d: SpotLight3D = $"../SpotLight3D"

func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		rotation.y+=.75*delta
	if Input.is_action_pressed("right"):
		rotation.y-=.75*delta
	if Input.is_action_just_pressed("flash"):
		print("hi")
		print(rotation.y)
		if rotation.y>.62:
			scary_terry_left.visible=false
		elif rotation.y<-.62:
			scary_terry_right.visible=false
	



func _on_timer_timeout() -> void:
	var num = randi_range(1,10)
	if num<5:
		camera_shake()

func camera_shake():
	print("boi")
	var x = randf_range(-.17,.17)
	var tween = get_tree().create_tween()
	tween.tween_property(camera,"position",Vector3(x,6.67,6.968),.1)
	tween.tween_property(camera,"position",Vector3(-x,6.33,6.968),.1)
	tween.tween_property(camera,"position",Vector3(0,6.513,6.968),.1)


func _on_bubble_timeout() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(camera,"position",Vector3(-.01,6.518,6.968),.05)
	tween.tween_property(camera,"position",Vector3(.01,6.503,6.968),.05)
	tween.tween_property(camera,"position",Vector3(0,6.513,6.968),.05)
