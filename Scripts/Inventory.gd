extends Node

const TAMANHO_MAX := 20
var slots: Array = []

func _ready():
	slots.resize(TAMANHO_MAX)

func adicionar_item(item: ItemData):
	for i in range(slots.size()):
		if slots[i] == null:
			slots[i] = item
			return true
	return false

func usar_item(index: int):
	var item = slots[index]
	if item == null:
		return
	
	if item.consumivel:
		print("Usando: ", item.nome)
		slots[index] = null
		
		emit_signal("inventory_updated")
		
signal inventory_updated
