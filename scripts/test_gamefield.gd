extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Game entered")
	var b1 = load("res://bubble.tscn").instantiate()
	b1.position = Vector2(74, 76)
	b1.resource = "Fire"
	b1.update_label()
	add_child(b1)

	var b2 = load("res://bubble.tscn").instantiate()
	b2.position = Vector2(880, 540)
	b2.resource = "Fire"
	b2.update_label()
	add_child(b2)

	var b3 = load("res://bubble.tscn").instantiate()
	b3.position = Vector2(555, 135)
	b3.resource = "Fire"
	b3.update_label()
	add_child(b3)

	var b4 = load("res://bubble.tscn").instantiate()
	b4.position = Vector2(104, 406)
	b4.resource = "Fuel"
	b4.update_label()
	add_child(b4)

	var b5 = load("res://bubble.tscn").instantiate()
	b5.position = Vector2(999, 280)
	b5.resource = "Water"
	b5.update_label()
	add_child(b5)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		#get_tree().change_scene_to_file("res://scenes/TitleCard.tscn")
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mousepress():
	print("Game left")
	pass
