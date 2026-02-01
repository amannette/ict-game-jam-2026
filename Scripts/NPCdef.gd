class_name NPC
extends Node

const control: PackedScene = preload("res://Scenes/dialogue/NPCscene.tscn")

@export var Prefered_diologe_type: String
@export var Disposition: int
@export var Name: String
@export var Name_2: String
@export var DispositionRate: int
@export var Expertise: String
@export var Department: String
@export var Mood: String
# mood = Cheerful, Sad, Angry, Apathetic, Chill
# Disposition = Disposition towards the Character between 0-100.00
# DispositionRate = Rate of Disposition change if wrong diologue is chosen
# Expertise = Doctor, Nurse, Detective, Civilian, Janator, Security, Accountant| Expertise might lead to specific diologue or use in game.
# Department = Buisness, HR, Managment, OR, ER, Nurses, Civilian, Security, Mortuary, Lab
# Name_2 = other name or nickname used to add depth to the game in diologue
# Prefered_diologe_type = Direct, Confrontational, Inquisitive, Vague

static func new_NPC(name: String, altname: String, preferedtype : String, expertise : String, department : String, mood : String,  npcid := 100, disposition := 50.0, dispositrate := 50.0 ) -> NPC:
	var new_NPC: NPC = control.instantiate()
	new_NPC.Name = name
	new_NPC.Name_2 = altname
	new_NPC.NPC_id = npcid
	new_NPC.Disposition = disposition
	new_NPC.DispositionRate = dispositrate
	new_NPC.Prefered_diologe_type = preferedtype
	new_NPC.Expertise = expertise
	new_NPC.Department = department
	new_NPC.Mood = mood
	return new_NPC
