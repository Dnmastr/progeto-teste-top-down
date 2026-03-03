extends CharacterBody2D

const SPEED = 300.0
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		# Troca a animação baseada na direção predominante
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				animated_sprite.play("direita")
			else:
				animated_sprite.play("esquerda")
		else:
			if direction.y > 0:
				animated_sprite.play("baixo")
			else:
				animated_sprite.play("cima")
	else:
		velocity = Vector2.ZERO
		animated_sprite.play("idle") # Animação parado

	move_and_slide()

func _input(event):
	if event.is_action_pressed("ui_accept"): # Enter
		var item = preload("res://Resources/semente_trigo.tres")
		Inventory.adicionar_item(item)
