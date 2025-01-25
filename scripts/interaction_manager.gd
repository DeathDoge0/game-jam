extends ResourcePreloader


class Outcome:
	var requirements = {}
	var output = {}

	static func declare(required: Dictionary, results: Dictionary):
		"""
		Ensures that the materials in this transaction are valid, and
		returns a new Outcome object representing the transaction if
		checks have passed.
		"""
		var o = Outcome.new()

		for k in required:
			assert(k in available_resources)
		for k in results:
			assert(k in available_resources)

		o.requirements = required
		o.output = results
		return o


	func keyval():
		"""
		Returns a list of the materials needed, irrespective of quantities.
		"""
		return requirements.keys()


	func _to_string() -> String:
		return "Needed: %s\nProduct: %s\n\n" % [requirements, output]


const available_resources = [
	"Dirt",
	"Fire",
	"Grass",
	"Water",
	"Mud",
	"Powder",
	"Metal",
	"Fuel",
	"Fuel Shavings",
	"Metal Scraps",
	"Light",
	"Heat",
	"Flower",
	"Rainbow"
]


var __outcomelist = [
	Outcome.declare({"Dirt": 1}, {"Powder": 2}),
	Outcome.declare({"Dirt": 3, "Water": 1}, {"Grass": 2, "Mud": 1}),
	Outcome.declare({"Fire": 3, "Fuel": 1}, {"Heat": 4, "Light": 2}),
	Outcome.declare({"Fire": 3, "Fuel Shavings": 3}, {"Heat": 3, "Light": 1}),
	Outcome.declare({"Fire": 1, "Grass": 4}, {"Dirt": 3, "Heat": 2}),
	Outcome.declare({"Fire": 5, "Metal Scraps": 4}, {"Metal": 1}),
	Outcome.declare({"Fire": 1, "Water": 1}, {}),
	Outcome.declare({"Flower": 5, "Light": 10}, {"Rainbow": 1}),
	Outcome.declare({"Fuel": 1, "Powder": 2}, {"Fuel": 2, "Fuel Shavings": 1}),
	Outcome.declare({"Fuel Shavings": 4}, {"Fuel": 1}),
	Outcome.declare({"Grass": 3, "Water": 3}, {"Flower": 3, "Grass": 1}),
	Outcome.declare({"Metal": 1, "Powder": 2}, {"Metal": 2, "Metal Scraps": 1}),
]

#While we do already have the list of outcomes above, we will put them into a
#dictionary for easier searching.  This assumes, of course, that ONLY ONE
#outcome is possible for any combination of resources.
var processor_outcomes = {}

func _ready() -> void:
	"""
	Construct the outcome dictionary, and ensure that none of the necessary
	resource structures can be changed from this point forward.
	"""
	for o in __outcomelist:
		processor_outcomes[o.keyval()] = o
	__outcomelist.make_read_only()

	for k in processor_outcomes.keys():
		k.make_read_only()
	processor_outcomes.make_read_only()
