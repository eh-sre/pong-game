extends MenuButton

var popup = get_popup()


func _ready():
	text = str(get_popup().get_item_text(0))

func _process(delta):
	popup.id_pressed.connect(_on_menu_button_pressed)
	

func _on_menu_button_pressed(id: int):
	#get_popup().set_focused_item(0)
	#get_popup().set_item_id(id, 0)
	print(id)
	text = popup.get_item_text(popup.get_item_index(id))
