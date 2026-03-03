extends TextureButton


var index: int

func atualizar(item):
	if item:
		texture_normal = item.icone
	else:
		texture_normal = null

func _pressed():
	Inventory.usar_item(index)
