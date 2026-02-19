extends Node3D
@onready var scary_terry_right: Node3D = $"SCARY TERRY RIGHT"
@onready var scary_terry_left: Node3D = $"SCARY TERRY LEFT"
@onready var camera: Camera3D = $Camera
@onready var animation_player: AnimationPlayer = $Camera/AnimationPlayer
var swerving = false

func _on_timer_timeout() -> void:
	if scary_terry_left.visible==false:
		if randi_range(1,10)<2:
			scary_terry_left.visible=true
	if scary_terry_right.visible==false:
		if randi_range(1,10)>8:
			scary_terry_right.visible=true

func _process(delta: float) -> void:
	var treelist = get_tree().get_nodes_in_group("tree")
	for tree in treelist:
		tree.position.z+=110*delta
		if tree.position.z >20:
			tree.position.z = -500
	if not swerving:
		if Input.is_action_just_pressed("swerveL"):
			swerving=true
			animation_player.play("swerve left")
			await get_tree().create_timer(2).timeout
			animation_player.play_backwards("swerve left")
			await get_tree().create_timer(1.1).timeout
			swerving=false
		if Input.is_action_just_pressed("swerveR"):
			swerving=true
			animation_player.play("swerve right")
			await get_tree().create_timer(2).timeout
			animation_player.play_backwards("swerve right")
			await get_tree().create_timer(1.1).timeout
			swerving=false


func _on_random_timeout() -> void:
	var num = randi_range(1,10)
	if num<5:
		camera_shake()
func camera_shake():
	print("boi")
	if not swerving:
		var orig_x= camera.position.x
		var orig_y = camera.position.y
		var x = randf_range(-.17,.17)
		var tween = get_tree().create_tween()
		tween.tween_property(camera,"position",Vector3(orig_x+x,orig_y+.15,6.968),.05)
		tween.tween_property(camera,"position",Vector3(orig_x-x,orig_y-.15,6.968),.05)
		tween.tween_property(camera,"position",Vector3(orig_x,orig_y,6.968),.05)

func _on_bubble_timeout() -> void:
	if not swerving:
		var orig_x= camera.position.x
		var orig_y = camera.position.y
		var tween = get_tree().create_tween()
		tween.tween_property(camera,"position",Vector3(orig_x-.01,orig_y-.01,6.968),.02)
		tween.tween_property(camera,"position",Vector3(orig_x+.01,orig_y+.01,6.968),.02)
		tween.tween_property(camera,"position",Vector3(orig_x,orig_y,6.968),.02)
