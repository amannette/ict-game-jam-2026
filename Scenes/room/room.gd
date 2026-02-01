extends Node2D

@onready var UI = $GameUi
@onready var bg_a = $Parallax2D/background/bg_a
@onready var bg_b = $Parallax2D/background/bg_b
@onready var junctions = $junctions
@export var fadeTime = 0.5

var _using_a := true
var _is_fading := false
var movementVisible = false

signal movementButtonSignal

var activeJunction = RoomManager.Junction

func _ready() -> void:
	crossFade(RoomManager.roomLibrary["reception"])
	# start the options menu in UI
	

func _process(delta: float) -> void:
	if movementVisible:
		$junctions.visible = true
	else:
		$junctions.visible = false
	if $Parallax2D.characterCount == 0:
		UI.disableNode($GameUi/options/optionList/communicate)
	elif $Parallax2D.characterCount > 0 and UI.options.visible == true:
			UI.revealNode(UI.options)

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
	
func updateJunctions() -> void:
	var activeJunction = RoomManager.activeJunction
	var visibleDirections = [false,false,false,false,false,false,false,false]
	var directionCount = junctions.get_child_count()
	var activeDirectionCount = activeJunction["directions"].size()
	for i in range(activeDirectionCount):
		for j in range(directionCount):
			if(activeJunction["directions"][i] == j): # for every active direction is it the same as our buttons direction? if yes then:
				visibleDirections[j] = visibleDirections[j] || true # we are at an active direction, lets keep it to render later
				junctions.get_child(j).get_node("Label").text = activeJunction["adjacentJunctions"][i] # lets set the direction with the coresponding location
	#im doing a seperate for loop to disable/enable the innactive/active direction buttons
	for k in range(directionCount):
		if(visibleDirections[k]):
			junctions.get_child(k).visible = true
		else:
			junctions.get_child(k).visible = false
	pass


func _on_north_texture_button_pressed() -> void:
	# TODO: communicate to game state that the room changed
	crossFade(RoomManager.roomLibrary[$junctions/north/Label.text])


func _on_south_texture_button_pressed() -> void:
	crossFade(RoomManager.roomLibrary[$junctions/south/Label.text])


func _on_east_texture_button_pressed() -> void:
	crossFade(RoomManager.roomLibrary[$junctions/east/Label.text])


func _on_west_texture_button_pressed() -> void:
	crossFade(RoomManager.roomLibrary[$junctions/west/Label.text])


func _on_northeast_texture_button_pressed() -> void:
	crossFade(RoomManager.roomLibrary[$junctions/northeast/Label.text])


func _on_northwest_texture_button_pressed() -> void:
	crossFade(RoomManager.roomLibrary[$junctions/northwest/Label.text])


func _on_southeast_texture_button_pressed() -> void:
	crossFade(RoomManager.roomLibrary[$junctions/southeast/Label.text])


func _on_southwest_texture_button_pressed() -> void:
	crossFade(RoomManager.roomLibrary[$junctions/southwest/Label.text])
