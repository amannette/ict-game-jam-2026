extends Control

@onready var pause = $pause
@onready var dialog = $dialog
@onready var options = $options

func hideControl() -> void:
	pass
	pause.visible = false
	dialog.visible = false
	options.visible = false

func disableNode(node: Button):
	node.disabled = true

func revealNode(node: Control) -> void:
	node.visible = true

func _ready() -> void:
	# Start every new scene with all UI not visible
	hideControl()

func _process(_delta: float) -> void:
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
