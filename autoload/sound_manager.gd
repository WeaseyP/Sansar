extends Node

@onready var bullet_sound = $BulletSound
@onready var explosion_sound: AudioStreamPlayer = $ExplosionSound
@onready var ting_sound: AudioStreamPlayer = $TingSound
@onready var ThumpSound: Array[AudioStreamPlayer] = [$ThumpSound, $ClackSound, $PunchySound] 





func fire_bullet():
	bullet_sound.play()

func explode():
	explosion_sound.play()

func ting():
	ting_sound.play()
	
func thump():
	#Pick a random sound from the array. 
	
	var sound = ThumpSound.pick_random()
	if sound != null:
		sound.play()
