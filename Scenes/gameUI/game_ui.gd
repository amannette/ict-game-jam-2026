extends Control

@onready var pause = get_node("pause")
@onready var dialog = get_node("dialog")
@onready var options = get_node("options")

func hideControl() -> void:
	pass
	pause.visible = false
	dialog.visible = false
	options.visible = false

func _ready() -> void:
	# Start every new scene with all UI not visible
	hideControl()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause") and !pause.visible == true:
		hideControl()
		pause.visible = true

# Pause functionality
func _on_return_pressed() -> void:
	# TODO: return back to game state
	pass # Replace with function body.


func _on_save_pressed() -> void:
	# TODO: give visual feedback that the game was saved
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu/Menu.tscn")
