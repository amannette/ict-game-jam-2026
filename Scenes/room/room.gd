extends Node2D

@onready var UI = $GameUi
@onready var bg_a = $Parallax2D/background/bg_a
@onready var bg_b = $Parallax2D/background/bg_b
@export var fadeTime = 0.5

var _using_a := true
var _is_fading := false
var movementVisible = false
var currentBG = "reception"

signal movementButtonSignal

var activeJunction = RoomManager.Junction

func _ready() -> void:
	crossFade(RoomManager.roomLibrary[currentBG])

func _process(delta: float) -> void:
	if $Parallax2D.characterCount == 0:
		UI.disableNode($GameUi/options/optionList/communicate)
	elif $Parallax2D.characterCount > 0 and UI.options.visible == true:
			UI.revealNode(UI.options)
	if currentBG != RoomManager.Junction["name"]:
		currentBG = str(RoomManager.Junction["name"])
		crossFade(RoomManager.roomLibrary[currentBG])

func crossFade(texture: Texture2D):
	if _is_fading:
		return
	
	var from = bg_a if _using_a else bg_b
	var to = bg_b if _using_a else bg_a
	
	to.texture = texture
	to.modulate.a = 0.0
	to.visible = true
	
	var tween = create_tween()
	tween.parallel().tween_property(from, "modulate:a", 0.0, fadeTime)
	tween.parallel().tween_property(to, "modulate:a", 1.0, fadeTime)

	await tween.finished

	from.visible = false
	_using_a = !_using_a
	_is_fading = false
	



#func _on_north_texture_button_pressed() -> void:
	## TODO: communicate to game state that the room changed
	#crossFade(RoomManager.roomLibrary[$junctions/north/Label.text])
#
#
#func _on_south_texture_button_pressed() -> void:
	#crossFade(RoomManager.roomLibrary[$junctions/south/Label.text])
#
#
#func _on_east_texture_button_pressed() -> void:
	#crossFade(RoomManager.roomLibrary[$junctions/east/Label.text])
#
#
#func _on_west_texture_button_pressed() -> void:
	#crossFade(RoomManager.roomLibrary[$junctions/west/Label.text])
#
#
#func _on_northeast_texture_button_pressed() -> void:
	#crossFade(RoomManager.roomLibrary[$junctions/northeast/Label.text])
#
#
#func _on_northwest_texture_button_pressed() -> void:
	#crossFade(RoomManager.roomLibrary[$junctions/northwest/Label.text])
#
#
#func _on_southeast_texture_button_pressed() -> void:
	#crossFade(RoomManager.roomLibrary[$junctions/southeast/Label.text])
#
#
#func _on_southwest_texture_button_pressed() -> void:
	#crossFade(RoomManager.roomLibrary[$junctions/southwest/Label.text])
