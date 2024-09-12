class_name Enemy
extends Area3D


var lifecycle = Lifecycle.new() 

func init(root_node, spawn): 
	lifecycle.init(root_node, self, spawn) 
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	lifecycle.process(self, delta)


func _on_area_entered(area):
	print("on_area_eneters") 
	print(area.position.x)

	if area.is_in_group("Bullet"):
		lifecycle.process_hit(self, area)
		area.queue_free()
	else:
		print("Entered by:", area.name)
