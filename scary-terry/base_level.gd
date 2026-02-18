extends Node3D
@onready var scary_terry_right: Node3D = $"SCARY TERRY RIGHT"
@onready var scary_terry_left: Node3D = $"SCARY TERRY LEFT"
@onready var camera: Camera3D = $Camera
@onready var animation_player: AnimationPlayer = $Camera/AnimationPlayer


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
