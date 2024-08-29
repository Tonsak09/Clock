extends Line2D

@export var radius : float
@export var density : int

func _ready():
	
	# Generate circle
	var delta = ((2.0 * PI) / float(density))
	for i in density:
		var angle = i * delta
		add_point(Vector2(cos(angle), sin(angle)) * radius)
	add_point(Vector2(cos(0.0), sin(0.0)) * radius) # Complete circle 

