extends Node3D
@onready var scary_terry_right: Node3D = $"SCARY TERRY RIGHT"
@onready var scary_terry_left: Node3D = $"SCARY TERRY LEFT"
@onready var camera: Camera3D = $Camera
@onready var animation_player: AnimationPlayer = $Camera/AnimationPlayer
var rabbit_scene = preload("res://rabbit_template.tscn")
var swerving = false
@onready var rabbit: Node3D = $rabbit
@onready var rabbitleft: Node3D = $rabbitleft
@onready var rabbitright: Node3D = $rabbitright
var orig_x
var orig_y 
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect
@onready var enemy_animation_player: AnimationPlayer = $"SCARY TERRY LEFT/Poses/AnimationPlayer"
@onready var enemy2_animation_player: AnimationPlayer = $"SCARY TERRY RIGHT/Run/AnimationPlayer"
var left_time = 0
var right_time = 0
@onready var animated_sprite_2d: AnimatedSprite2D = $CanvasLayer/AnimatedSprite2D
@onready var animation_player_2: AnimationPlayer = $Camera/AnimationPlayer2
@onready var label: Label = $CanvasLayer/Label
@onready var color_rect_2: ColorRect = $CanvasLayer/ColorRect2
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var swerve: AudioStreamPlayer = $swerve
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var audio_stream_player_3d_2: AudioStreamPlayer3D = $AudioStreamPlayer3D2
var announcement_playing = true
var collision = preload("res://area_3d.tscn")
@onready var animated_sprite_2d_2: AnimatedSprite2D = $CanvasLayer/AnimatedSprite2D2
@onready var jumpscare_sound: AudioStreamPlayer = $jumpscare
var jumpscared = false
@onready var jump_1: Sprite2D = $CanvasLayer/jump1
@onready var jump_2: Sprite2D = $CanvasLayer/jump2
@onready var jump_3: Sprite2D = $CanvasLayer/jump3
@onready var jump_4: Sprite2D = $CanvasLayer/jump4
@onready var scary: AudioStreamPlayer = $scary
var fading = false
@onready var color_rect_3: ColorRect = $CanvasLayer/AnimatedSprite2D2/ColorRect3
@onready var button: Button = $CanvasLayer/Button
var time = 0
@onready var label_2: Label = $CanvasLayer/Label2
var clock = 0
func _ready() -> void:
	orig_x= camera.position.x
	orig_y = camera.position.y
	label.text = "You wake up with the car traveling in a straight line
	down a secluded road"
	await get_tree().create_timer(5).timeout
	label.text = "You are traveling through the wooded parts of the east coast 
	on a family roadtrip to Niagara Falls"
	await get_tree().create_timer(5).timeout
	label.text = "Then you notice the car is completely empty except for yourself"
	await get_tree().create_timer(5).timeout
	label.text = "*This must be a dream* You think, 
	until you hear something from the radio"
	await get_tree().create_timer(5).timeout
	audio_stream_player.play()
	label.text="This is a county wide emergency warning."
	await get_tree().create_timer(2.5).timeout
	label.text = "If you are traveling in the Vandermark 
	state forest between Arkport and Bellsville, please have caution. "
	await get_tree().create_timer(6).timeout
	label.text="Wildlife has been acting strange lately,
	 sometimes completely blocking roads."
	await get_tree().create_timer(5).timeout
	label.text = "It is recommended to keep your speed at
	 a slower pace to avoid hitting them. "
	await get_tree().create_timer(5).timeout
	label.text = "In addition, strange sightings of an indescribable
	 creature at night, possibly a bear,"
	await get_tree().create_timer(5.5).timeout
	label.text = "along with mysterious car crashes and missing persons 
	cases due to heavy fog have been common in the area."
	await get_tree().create_timer(5.8).timeout
	label.text="Visitors should stay extra vigilant 
	on their trip through the state forest, especially on secluded roads."
	await get_tree().create_timer(6.3).timeout
	announcement_playing=false
	label.visible=false
	color_rect_2.visible= false
	
func _on_timer_timeout() -> void:
	if announcement_playing == false:
		if scary_terry_left.visible==false:
			if randi_range(1,10)<2:
				scary_terry_left.visible=true
		if scary_terry_right.visible==false:
			if randi_range(1,10)>8:
				scary_terry_right.visible=true
		var rand = randi_range(1,10)
		print(rand)
		if rand>3 and rand<6:
			print(str(rand)+"hello")
			spawn_obstacles()

func spawn_obstacles():
	print("RABBITS MADE")
	var vorp = randi_range(1,9)
	if vorp <4:
		var rabbit_inst = rabbit_scene.instantiate()
		var rabbit_inst2 = rabbit_scene.instantiate()
		var collisionshape = collision.instantiate()
		var collisionshape2 = collision.instantiate()
		add_child(rabbit_inst)
		add_child(rabbit_inst2)
		add_child(collisionshape)
		add_child(collisionshape2)
		rabbit_inst.scale = Vector3(.4,.4,.4)
		rabbit_inst2.scale = Vector3(.4,.4,.4)
		rabbit_inst.add_to_group("rabbit")
		rabbit_inst2.add_to_group("rabbit")
		collisionshape.add_to_group("rabbit")
		collisionshape2.add_to_group("rabbit")
		rabbit_inst.position = rabbitright.position
		rabbit_inst2.position = rabbit.position
		collisionshape.position = rabbit_inst.position
		collisionshape2.position = rabbit_inst2.position
	elif vorp>3 and vorp<7:
		var rabbit_inst = rabbit_scene.instantiate()
		var rabbit_inst2 = rabbit_scene.instantiate()
		var collisionshape = collision.instantiate()
		var collisionshape2 = collision.instantiate()
		add_child(rabbit_inst)
		add_child(rabbit_inst2)
		add_child(collisionshape)
		add_child(collisionshape2)
		rabbit_inst.scale = Vector3(.4,.4,.4)
		rabbit_inst2.scale = Vector3(.4,.4,.4)
		rabbit_inst.add_to_group("rabbit")
		rabbit_inst2.add_to_group("rabbit")
		collisionshape.add_to_group("rabbit")
		collisionshape2.add_to_group("rabbit")
		rabbit_inst.position = rabbitleft.position
		rabbit_inst2.position = rabbit.position
		collisionshape.position = rabbit_inst.position
		collisionshape2.position = rabbit_inst2.position
	else:
		var rabbit_inst = rabbit_scene.instantiate()
		var rabbit_inst2 = rabbit_scene.instantiate()
		var collisionshape = collision.instantiate()
		var collisionshape2 = collision.instantiate()
		rabbit_inst.add_to_group("rabbit")
		rabbit_inst2.add_to_group("rabbit")
		collisionshape.add_to_group("rabbit")
		collisionshape2.add_to_group("rabbit")
		add_child(rabbit_inst)
		add_child(rabbit_inst2)
		add_child(collisionshape)
		add_child(collisionshape2)
		rabbit_inst.scale = Vector3(.4,.4,.4)
		rabbit_inst2.scale = Vector3(.4,.4,.4)
		rabbit_inst.position = rabbitleft.position
		rabbit_inst2.position = rabbitright.position
		collisionshape.position = rabbit_inst.position
		collisionshape2.position = rabbit_inst2.position
		
func jumpscare():
	if not jumpscared:
		jumpscared = true
		print("JUMPSCARED")
		jumpscare_sound.play()
		await get_tree().create_timer(.1).timeout
		scary.play()
		jump_1.visible=true
		await get_tree().create_timer(.1).timeout
		jump_1.visible=false
		jump_2.visible=true
		await get_tree().create_timer(.05).timeout
		jump_2.visible=false
		jump_3.visible=true
		await get_tree().create_timer(.05).timeout
		jump_3.visible=false
		jump_4.visible=true
		await get_tree().create_timer(.05).timeout
		jump_4.visible=false
		await get_tree().create_timer(.05).timeout
		jump_1.visible=true
		await get_tree().create_timer(.05).timeout
		jump_1.visible=false
		jump_2.visible=true
		await get_tree().create_timer(.05).timeout
		jump_2.visible=false
		jump_3.visible=true
		await get_tree().create_timer(.05).timeout
		jump_3.visible=false
		jump_4.visible=true
		await get_tree().create_timer(.05).timeout
		jump_4.visible=false
		animated_sprite_2d_2.visible= true
		animated_sprite_2d_2.play()
		fading = true
		await get_tree().create_timer(3).timeout
		button.visible=true
		
func flash():
	color_rect.modulate.a = 1

func win():
	get_tree().change_scene_to_file("res://canvas_layer.tscn")

func _process(delta: float) -> void:
	time+=1*delta
	print(time)
	if time > 45:
		time =0
		clock+=1
		label_2.text = str(clock)+"AM"
	if clock ==6:
		call_deferred("win")
	if fading:
		color_rect_3.modulate.a+=.05*delta
	if scary_terry_left.visible == true:
		if not audio_stream_player_3d.playing:
			audio_stream_player_3d.play()
	else:
		audio_stream_player_3d.stop()
	if scary_terry_right.visible == true:
		if not audio_stream_player_3d_2.playing:
			audio_stream_player_3d_2.play()
	else:
		audio_stream_player_3d_2.stop()
	color_rect.modulate.a -=.067
	animated_sprite_2d.modulate.a=0.09
	if Input.is_action_just_pressed("flash"):
		if camera.rotation.y>.62:
			scary_terry_left.visible=false
			flash()
			left_time = 0
		elif camera.rotation.y<-.62:
			camera.scary_terry_right.visible=false
			flash()
			right_time = 0
	if scary_terry_left.visible == true:
		if not swerving:
			left_time+=1*delta
	if scary_terry_right.visible == true:
		if not swerving:
			right_time+=1*delta
	if right_time>4 or left_time >4:
		jumpscare()
	enemy_animation_player.speed_scale = .2
	enemy_animation_player.play("Poses")
	enemy2_animation_player.speed_scale = 4
	enemy2_animation_player.play("Run")
	var treelist = get_tree().get_nodes_in_group("tree")
	for tree in treelist:
		tree.position.z+=110*delta
		if tree.position.z >20:
			tree.position.z = -500
	var rabbitlist = get_tree().get_nodes_in_group("rabbit")
	for tree in rabbitlist:
		tree.position.z+=110*delta
	if not swerving:
		if Input.is_action_just_pressed("swerveL"):
			swerving=true
			swerve.play()
			animation_player_2.play("spin wheel")
			animation_player.play("swerve left")
			await get_tree().create_timer(2).timeout
			animation_player.play_backwards("swerve left")
			animation_player_2.play_backwards("spin wheel")
			await get_tree().create_timer(1.1).timeout
			swerving=false
		if Input.is_action_just_pressed("swerveR"):
			swerving=true
			swerve.play()
			animation_player_2.play_backwards("spin wheel")
			animation_player.play("swerve right")
			await get_tree().create_timer(2).timeout
			animation_player.play_backwards("swerve right")
			animation_player_2.play("spin wheel")
			await get_tree().create_timer(1.1).timeout
			swerving=false


func _on_random_timeout() -> void:
	var num = randi_range(1,10)
	if num<5:
		camera_shake()
func camera_shake():
	print("boi")
	if not swerving:
		var x = randf_range(-.17,.17)
		var tween = get_tree().create_tween()
		tween.tween_property(camera,"position",Vector3(orig_x+x,orig_y+.15,6.968),.05)
		tween.tween_property(camera,"position",Vector3(orig_x-x,orig_y-.15,6.968),.05)
		tween.tween_property(camera,"position",Vector3(orig_x,orig_y,6.968),.05)
		var tween2 = get_tree().create_tween()
		tween2.tween_property(animated_sprite_2d_2,"position",Vector2(575+x,322+.15),.05)
		tween2.tween_property(animated_sprite_2d_2,"position",Vector2(575-x,322-.15),.05)
		tween2.tween_property(animated_sprite_2d_2,"position",Vector2(575,322),.05)
func _on_bubble_timeout() -> void:
	if not swerving:
		var tween = get_tree().create_tween()
		tween.tween_property(camera,"position",Vector3(orig_x-.01,orig_y-.01,6.968),.02)
		tween.tween_property(camera,"position",Vector3(orig_x+.01,orig_y+.01,6.968),.02)
		tween.tween_property(camera,"position",Vector3(orig_x,orig_y,6.968),.02)


func _on_car_area_entered(area: Area3D) -> void:
	jumpscare()


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
