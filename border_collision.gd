extends Area2D

func _ready():
	var screen_size = get_viewport().get_size()
	
	# Define the polygon as a rectangle around the screen edges
	var polygon = Array([
		Vector2(-screen_size.x / 2, -screen_size.y / 2),  # Top-left
		Vector2(screen_size.x / 2, -screen_size.y / 2),   # Top-right
		Vector2(screen_size.x / 2, screen_size.y / 2),    # Bottom-right
		Vector2(-screen_size.x / 2, screen_size.y / 2),   # Bottom-left
	])
	
	# Set the polygon to the CollisionPolygon2D node
	$CollisionPolygon2D.polygon = polygon
