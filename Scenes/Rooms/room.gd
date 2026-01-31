extends Node2D

@onready var UI = $GameUi

func _ready() -> void:
	# start the options menu in UI
	if $Parallax2D.characterCount == 0:
		UI.disableNode($GameUi/options/optionList/communicate)
	UI.revealNode(UI.options)
