extends Node

signal inventory_updated

const TAMANHO_MAX := 10
var slots: Array = []

func _ready():
	slots.resize(TAMANHO_MAX)


func adicionar_item(item: ItemData) -> bool:
	for i in range(slots.size()):
		if slots[i] == null:
			slots[i] = item
			emit_signal("inventory_updated")
			return true
	
	print("Inventário cheio!")
	return false


func usar_item(index: int):
	if index < 0 or index >= slots.size():
		return
	
	var item = slots[index]
	if item == null:
		return
	
	if item.consumivel:
		print("Usando:", item.nome)
		slots[index] = null
		emit_signal("inventory_updated")
