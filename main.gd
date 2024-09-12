extends Node3D


@onready var debug = $Debug
@onready var player = $Player

var fire_cadence = 0.1
var fire_cooldown = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.set_boundary(
		$"Boundary/LeftWall".position.x,
		$"Boundary/RighWall".position.x,
		$"Boundary/TopWall".position.z,
		$"Boundary/BottomWall".position.z
		
	)
	GameManager.spawn_stars(self)
	GameManager.spawn_asteroids(self)
	player.connect("player_destroyed", Callable(self, "_on_player_destroyed"))
	player.init()
	GameManager.set_player(player)
	debug.init(player)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	GameManager.process_background(self, delta)
	if Input.is_action_pressed("shoot_primary") and fire_cooldown <= 0:
		fire_bullet()
	fire_cooldown -= delta
	
func fire_bullet():
	if Utils.is_valid_node(player):
		fire_cooldown =	fire_cadence
		GameManager.fire_player_weapon(self)


func _on_player_destroyed(player):
	player.queue_free()


func _on_enemy_destroyed(enemy):
	GameManager.create_explosion(self, enemy, 15, 15)

func _on_show_hit_effect(enemy, bullet):
	print("_onshow_")
	print(bullet.global_position.x)
	GameManager.create_hit_effect(self, enemy, bullet)
