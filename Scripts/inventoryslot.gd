extends TextureButton

var index: int
@onready var quantidade_label = $Label

func atualizar(item: ItemData):
	if item == null:
		texture_normal = null
		quantidade_label.text = ""
	else:
		texture_normal = item.icone
		quantidade_label.text = ""  # sem stack por enquanto

func _pressed():
	Inventory.usar_item(index)

# 🔹 Início do drag
func _get_drag_data(at_position):
	var slot = Inventory.slots[index]
	
	if slot == null or slot.item == null:
		return
	
	var preview = TextureRect.new()
	preview.texture = slot.item.icone
	preview.custom_minimum_size = Vector2(48, 48)
	
	set_drag_preview(preview)
	
	return {
		"from_index": index
	}

# 🔹 Pode soltar aqui?
func _can_drop_data(at_position, data):
	return data.has("from_index")

# 🔹 Quando soltar
func _drop_data(at_position, data):
	var from_index = data["from_index"]
	
	var temp = Inventory.slots[index]
	Inventory.slots[index] = Inventory.slots[from_index]
	Inventory.slots[from_index] = temp
	
	Inventory.emit_signal("inventory_updated")
