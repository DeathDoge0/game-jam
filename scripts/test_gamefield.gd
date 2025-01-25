extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ResourceProcessor.products_made.connect(add_bubbles)

	var b1 = load("res://bubble.tscn").instantiate()
	b1.position = Vector2(74, 76)
	b1.resource = "Fire"
	b1.set_sprite(InteractionManager.get_image(b1.resource))
	add_child(b1)

	var b2 = load("res://bubble.tscn").instantiate()
	b2.position = Vector2(880, 540)
	b2.resource = "Fire"
	b2.set_sprite(InteractionManager.get_image(b2.resource))
	add_child(b2)

	var b3 = load("res://bubble.tscn").instantiate()
	b3.position = Vector2(555, 135)
	b3.resource = "Fire"
	b3.set_sprite(InteractionManager.get_image(b3.resource))
	add_child(b3)

	var b4 = load("res://bubble.tscn").instantiate()
	b4.position = Vector2(104, 406)
	b4.resource = "Fuel"
	b4.set_sprite(InteractionManager.get_image(b4.resource))
	add_child(b4)

	var b5 = load("res://bubble.tscn").instantiate()
	b5.position = Vector2(999, 280)
	b5.resource = "Water"
	b5.set_sprite(InteractionManager.get_image(b5.resource))
	add_child(b5)


func add_bubbles(resources):
	print(resources)
	for i in range(len(resources)):
		var bubb = load("res://bubble.tscn").instantiate()
		var processorloc = $ProcessorOutputPath/ProcessorPathLocation
		processorloc.progress_ratio = (float(i) / len(resources))
		bubb.position = processorloc.position
		bubb.resource = resources[i]
		bubb.update_label()		
		add_child(bubb)
	
