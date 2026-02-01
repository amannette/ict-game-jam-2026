class_name diologue
extends Node

const control: PackedScene = preload("res://Scenes/dialogue/DialogueScene.tscn")

@export var Diologue_path_id: int
@export var Diologue_path_requisite_id: int
@export var Diologue_text_initial: String
@export var Diologue_text_leading: String
@export var Char_Diologue_first_option: String
@export var Char_Diologue_second_option: String
@export var Char_Diologue_third_option: String
@export var Char_Diologue_first_option_type: String
@export var Char_Diologue_second_option_type: String
@export var Char_Diologue_third_option_type: String
@export var Char_Diologue_first_option_outcome: int
@export var Char_Diologue_second_option_outcome: int
@export var Char_Diologue_third_option_outcome: int
@export var Char_Diologue_secret_option: String
@export var Char_Diologue_secret_option_requisite: int
@export var Char_Diologue_secret_option_dispositon: int
@export var Char_Diologue_secret_option_type: String
@export var Char_Diologue_secret_option_outcome: int

static func new_diologue(diloguepathid: int,diloguepathrequisiteid: int, first_text: String, second_text: String,
firstdiologueoption: String, firstdiologueoption_type: String, firstdiologueoption_outcome: int,
seconddiologueoption: String, seconddiologueoption_type: String, seconddiologueoption_outcome: int,
thirddiologueoption: String, thirddiologueoption_type: String , thirddiologueoption_outcome: int,
secretdiologueoption: String, secretdiologueoption_type: String , secretdiologueoption_outcome: int,secretdiologueoption_dispositon: int, secretdiologueoption_requisite: int
) -> diologue:
	var new_diologue: diologue = control.instantiate()
	new_diologue.Diologue_path_id = diloguepathid
	new_diologue.Diologue_path_requisite_id = diloguepathrequisiteid
	new_diologue.Diologue_text_initial = first_text
	new_diologue.Diologue_text_leading = second_text
	new_diologue.Char_Diologue_first_option = firstdiologueoption
	new_diologue.Char_Diologue_second_option = seconddiologueoption
	new_diologue.Char_Diologue_third_option = thirddiologueoption
	new_diologue.Char_Diologue_first_option_type = firstdiologueoption_type
	new_diologue.Char_Diologue_second_option_type = seconddiologueoption_type
	new_diologue.Char_Diologue_third_option_type = thirddiologueoption_type
	new_diologue.Char_Diologue_first_option_outcome = firstdiologueoption_outcome
	new_diologue.Char_Diologue_second_option_outcome = seconddiologueoption_outcome
	new_diologue.Char_Diologue_third_option_outcome = thirddiologueoption_outcome
	new_diologue.Char_Diologue_secret_option = secretdiologueoption
	new_diologue.Char_Diologue_secret_option_requisite = secretdiologueoption_requisite
	new_diologue.Char_Diologue_secret_option_dispositon = secretdiologueoption_dispositon
	new_diologue.Char_Diologue_secret_option_type = secretdiologueoption_type
	new_diologue.Char_Diologue_secret_option_outcome = secretdiologueoption_outcome
	return new_diologue
