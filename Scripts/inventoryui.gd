extends CanvasLayer

@onready var grid = $Panel/GridContainer
var slot_scene = preload("res://Cenas/InventorySlot.tscn")

func _ready():
	criar_slots()
	atualizar()
	Inventory.inventory_updated.connect(atualizar)
	print("Slots criados:", grid.get_child_count())
	
func criar_slots():
	for i in range(Inventory.TAMANHO_MAX):
		var slot = slot_scene.instantiate()
		slot.index = i
		grid.add_child(slot)

func atualizar():
	for i in range(grid.get_child_count()):
		var slot = grid.get_child(i)
		slot.atualizar(Inventory.slots[i])
		
func _input(event):
	if event.is_action_pressed("inventory"):
		visible = !visible
