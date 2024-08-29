extends Node2D

@export var secRadius : float
@export var secDensity : int

var nodule = preload("res://Prefabs/Nodule.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	InstantiateNodules()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# month, day, hour, minute
	var dic = Time.get_datetime_dict_from_system()
	print_debug(dic)

func InstantiateNodules():
	# Generate circle
	var delta = ((2.0 * PI) / float(secDensity))
	for i in secDensity:
		var angle = (i * delta) - (PI / 2.0)
		var point = Vector2(cos(angle), sin(angle)) * secRadius
		var instance = nodule.instantiate()
		
		if str(i).length() == 1:
			instance.get_child(1).text = "0" + str(i)
		else:
			instance.get_child(1).text = str(i)
		
		add_child(instance)
		instance.position = point
	#add_point(Vector2(cos(0.0), sin(0.0)) * secRadius) # Complete circle 
