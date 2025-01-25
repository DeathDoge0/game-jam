extends Node2D


var current_resources = {}


func attempt_production():
	var _has_res = func (res: String):
		return res in current_resources

	for combo: Array in InteractionManager.processor_outcomes:
		if combo.all(_has_res):
			#Outcome.declare({"Fire": 3, "Fuel Shavings": 3}, {"Heat": 3, "Light": 1}),
			var reaction: InteractionManager.Outcome = InteractionManager.processor_outcomes[combo]
			var _hasenough = func (res: String):
				return current_resources[res] >= reaction.requirements[res]
			
			if combo.all(_hasenough):
				for prod in reaction.output:
					for i in range(reaction.output[prod]):
						produce_bubble(prod)


func produce_bubble(product: String):
	var bubble = load("res://bubble.tscn").instantiate()



func _process(delta: float) -> void:
	if $ReactionArea.has_overlapping_bodies():
		for b in $ReactionArea.get_overlapping_bodies():

			#Game crashes when dragging a bubble to the processor without this.
			#Something about assigning values to an object of type `previously freed`?!
			#Now, you have to release the drag to properly feed the processor.
			if b.get_parent().is_dragging: continue

			var res = b.get_parent().resource
			if res not in current_resources:
				current_resources[res] = 0
			current_resources[res] += 1
			b.queue_free()

	attempt_production()
	print(current_resources)
