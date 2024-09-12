extends GPUParticles3D

var elapsed_time = 0.0

func init(x, z):
	global_position = (Vector3(x,0,z))
	emitting = false
	restart()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed_time += delta
	if elapsed_time > 0.3:
		emitting = false
		queue_free()
		
