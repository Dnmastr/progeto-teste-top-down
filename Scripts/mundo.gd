extends Node2D


func _ready():
	var som_mundo = preload("res://Imagens/ambiente1.ogg")
	somambiente.play_ambience(som_mundo)
