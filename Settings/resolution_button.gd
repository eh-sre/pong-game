extends OptionButton


#func _on_item_selected(index):
	#var window = get_window()
	#var extracted_string = get_item_text(index).split("x")
	#var win_size = Vector2i(int(extracted_string[0]), int(extracted_string[1]))
	#print(window.get_size())
	#window.set_size(win_size)
	#window.move_to_center()

func _on_item_selected(index):
	var extracted_string = get_item_text(index).split("x")
	var new_size = Vector2i(int(extracted_string[0]), int(extracted_string[1]))
	print(new_size)
	get_window().size = new_size
