extends Node3D

@onready var fire_mesh = $Fire


var fire_width
var fire_height
var fire_speed
var fire_aperture = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fire_mesh.mesh.size = Vector2(fire_width, fire_height)
	
	
func init(x, z, width, height, speed = 3):
	translate(Vector3(x, 0, z))
	fire_width = width
	fire_height = height
	fire_speed = speed
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fire_aperture < 1.0:
		fire_aperture += delta * fire_speed
		fire_mesh.set_instance_shader_parameter("fire_aperture", fire_aperture)
	else: 
		queue_free()
		
		
