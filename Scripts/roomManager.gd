extends Node
var directions = [0,1,2,3,4,5,6,7,8]
#[Vector2(0.3437246,.848483),Vector2(0,1)]




var dialogueOption = {
	"isHidden" : false,
	"text" : "",
	"requiredEvents" : []
}

var dialgogueTree = {
	"options" : [dialogueOption]
}
#[dialogtree1,dialogtree1,dialogtree1]


#var NPCs = []
var NPC = {
	"name" : "Mew",
	"name_2" : "Muncher",
	"dialoguePreference" : "Confrontational",
	"dispositionRate" : 10,
	"expertise" : "mewing",
	"department" : "patient",
	"mood" : "apathetic" , 
	"dialogueState" : 0 #this is where the player is on this NPCs dialogue tree
}

var NPCS = {
	"robert" : NPC.duplicate(),
	"mia" : NPC.duplicate(), 
	"janice" : NPC.duplicate(), 
	"janitor" : NPC.duplicate(),
	"jim" : NPC.duplicate()
}


#func initNPCS(name1, name2, dialoguePref, dispoRate, expertise, department, mood, initState):





var Junction = {
	"name" : "reception",
	"directions" : [],
	"adjacentJunctions" : ["cafeteria","hallway","lab","patient1"] ,
	"npcs" : ["robert","janice","jim"] ,	
	"items" : []
}

func defineJunction(name, directions, adjecentJunctions, npcs, items):
	var junct = Junction.duplicate(false)
	junct["name"] = name
	junct["directions"] = directions
	junct[adjecentJunctions] = adjecentJunctions
	junct["npcs"] = npcs
	junct["items"] = items
	return junct

var activeJunction = Junction.duplicate()
var activeConversationPartner = NPC.duplicate()


var roomLibrary = {
	"admin": preload("res://Assets/finishedRooms/administration.png"),
	"cafeteria": preload("res://Assets/finishedRooms/cafeteria.png"),
	"hallway": preload("res://Assets/finishedRooms/hallway.png"),
	"lab": preload("res://Assets/rooms/Lab.png"),
	"morgue": preload("res://Assets/rooms/Morgue.png"),
	"patient1": preload("res://Assets/rooms/Patient Room1.png"),
	"patient2": preload("res://Assets/rooms/Patient Room2.png"),
	"reception": preload("res://Assets/finishedRooms/reception.png"),
	"reception2": preload("res://Assets/finishedRooms/receptionBehind.png"),
	"surgery": preload("res://Assets/finishedRooms/surgery.png")
}

#var roomLibrary = {
	#"admin": preload("res://Assets/rooms/Admin.png"),
	#"cafeteria": preload("res://Assets/rooms/Cafeteria.png"),
	#"hallway": preload("res://Assets/rooms/Hallway.png"),
	#"lab": preload("res://Assets/rooms/Lab.png"),
	#"morgue": preload("res://Assets/rooms/Morgue.png"),
	#"patient1": preload("res://Assets/rooms/Patient Room1.png"),
	#"patient2": preload("res://Assets/rooms/Patient Room2.png"),
	#"reception": preload("res://Assets/rooms/Reception.png"),
	#"reception2": preload("res://Assets/rooms/Reception2.png"),
	#"surgery": preload("res://Assets/rooms/Surgery.png")
#}

var characterLibrary = {
	"robert": preload("res://Assets/characters/ppeperson1.png"),
	"mia": preload("res://Assets/characters/surgeon.png"),
	"janice": preload("res://Assets/characters/pressureSurgeon.png"),
	"jim": preload("res://Assets/characters/security.png"),
	"janitor": preload("res://Assets/characters/janitor.png")
}

func _enter_tree() -> void:
	pass
	#NPCS["robert"]["Name"]
	#NPCS["mia"]
	#NPCS["janice"]
	#NPCS["jim"]
	#NPCS["janitor"]
		
		
	
	
func onJunctionLoad(activeJunction):
	#$gameUI.build_junction(Junction.adjacentJunctions[1])
	#save routine 
	
	#load routine
	var JunctionName = activeJunction.Name
	#look through save rewrite Junctions parameters with 
	#populate room scene data with active junction data

func movementButtonEngaged(direction):
	#move scene logic
	activeJunction.Name = activeJunction["adjacentJunctions"][activeJunction["directions"][direction]]
	#activeJunction = adjacentJunction[activeJunction["directions"][direction]]
	pass


#NPCs from benjamin
#[node name="NPC2" parent="." unique_id=1271583253 instance=ExtResource("2_u74th")]
#Prefered_diologe_type = "Confrontational"
#Disposition = 40
#Name = "robert"
#Name_2 = "sanchezz"
#DispositionRate = 10
#Expertise = "Civilian"
#Department = "Civilian"
#Mood = "Angry"
#
#[node name="NPC3" parent="." unique_id=965265231 instance=ExtResource("2_u74th")]
#Prefered_diologe_type = "Inquisitive"
#Disposition = 42
#Name = "jim"
#Name_2 = "tim"
#DispositionRate = 2
#Expertise = "Accountant"
#Department = "Managment"
#Mood = "Apathetic"
#
#[node name="NPC4" parent="." unique_id=324083473 instance=ExtResource("2_u74th")]
#Prefered_diologe_type = "Vague"
#Name = "mia"
#Name_2 = "that depressed  nurse"
#DispositionRate = 15
#Mood = "Sad"
#
#[node name="NPC1" parent="." unique_id=1931630368 instance=ExtResource("2_u74th")]
#Prefered_diologe_type = "Direct"
#Disposition = 50
#Name = "Janice"
#Name_2 = "Jan"
#DispositionRate = 5
#Expertise = "Nurse"
#Department = "Nurses"
#Mood = "Cheerful"
	

	
