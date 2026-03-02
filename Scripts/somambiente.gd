extends Node

@onready var player = $AudioStreamPlayer

func play_ambience(stream: AudioStream):
	player.stream = stream
	player.play()

func stop_ambience():
	player.stop()
