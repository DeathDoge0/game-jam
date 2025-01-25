extends CollisionPolygon2D

var screen_size : Vector2i
var border_width = 1000

func _ready():
	screen_size = get_viewport().get_size()
	set_border()

func _process(delta):
	# Check if window size has changed
	if get_viewport().get_size() != screen_size:
		screen_size = get_viewport().get_size() # Update the previous size
		set_border()

func set_border():
	var polygon = PackedVector2Array([
		Vector2(-screen_size.x, -screen_size.y / 2),
		Vector2(screen_size.x / 2, -screen_size.y / 2),   # Top-right
		Vector2(screen_size.x / 2, screen_size.y / 2),    # Bottom-right
		Vector2(-screen_size.x / 2, screen_size.y / 2),   # Bottom-left
		Vector2(-screen_size.x / 2, -screen_size.y / 2),   # Top-left
		Vector2(-screen_size.x, -screen_size.y / 2),
		Vector2(-screen_size.x, screen_size.y),
		Vector2(screen_size.x, screen_size.y),
		Vector2(screen_size.x, -screen_size.y),
		Vector2(-screen_size.x, -screen_size.y),
	])
	
	# Set the polygon to the CollisionPolygon2D node
	set_polygon(polygon)
	
