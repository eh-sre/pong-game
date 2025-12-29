extends Node

@onready var tree := get_tree()
@onready var root := tree.get_root()

func get_current_scene():
	return tree.current_scene

func change_current_scene(scene: String):
	#root.remove_child(get_current_scene())
	#tree.reload_current_scene()
	# can use both line 10 or line 11. its just a matter of choice
	#tree.unload_current_scene()
	tree.change_scene_to_file(scene)

func quit():
	tree.quit()
