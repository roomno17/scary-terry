extends Node3D
@onready var scary_terry_right: Node3D = $"SCARY TERRY RIGHT"
@onready var scary_terry_left: Node3D = $"SCARY TERRY LEFT"



func _on_timer_timeout() -> void:
	if scary_terry_left.visible==false:
		if randi_range(1,10)<4:
			scary_terry_left.visible=true
	if scary_terry_right.visible==false:
		if randi_range(1,10)<4:
			scary_terry_right.visible=true
