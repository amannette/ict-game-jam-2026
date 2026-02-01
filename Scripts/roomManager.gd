extends Node
var directions = [0,1,2,3,4,5,6,7,8]
#[Vector2(0.3437246,.848483),Vector2(0,1)]




var dialogueOption = {
	"isHidden" : false,
	"text" : "",
	"requiredEvents" : []
}

var allNPCs = ["robert","janice","jim","mia", "jani", "sandi","cheg", "johan", "angelo", "kyle", "phelicia", "craig", "hilda", "skye"] 

var Junction = {
	"name" : "reception",
	"directions" : [1,3,4,6], #eight directions [0,1,2,3,4,5,6,7] can be [n,s,e,w,ne,nw,se,sw] or [sw,w,nw,n,ne,e,se,s] starting from direction [-1,-1](sw) going clockwise in a circle
	"adjacentJunctions" : ["cafeteria","hallway","lab","patient1"] ,
	"npcs" : ["robert","janice","jim","mia", "jani", "sandi","cheg", "johan", "angelo", "kyle", "phelicia", "craig", "hilda", "skye"] 
}

func defineJunction(name, directions, adjecentJunctions, npcs):
	var junct = Junction.duplicate(false)
	junct["name"] = name
	junct["directions"] = directions
	junct[adjecentJunctions] = adjecentJunctions
	junct["npcs"] = npcs

	return junct

var activeJunction = Junction.duplicate()


var roomLibrary = {
	"admin": preload("res://Assets/finishedRooms/administration.png"),
	"cafeteria": preload("res://Assets/finishedRooms/cafeteria.png"),
	"hallway": preload("res://Assets/finishedRooms/hallway.png"),
	"lab": preload("res://Assets/rooms/Lab.png"), #
	"morgue": preload("res://Assets/finishedRooms/morgue1.png"),
	"patient1": preload("res://Assets/finishedRooms/patient1.png"),
	"patient2": preload("res://Assets/finishedRooms/patient2.png"),
	"reception": preload("res://Assets/finishedRooms/reception.png"),
	"reception2": preload("res://Assets/finishedRooms/receptionBehind.png"),
	"surgery": preload("res://Assets/finishedRooms/surgery.png"),
	"breakroom": preload("res://Assets/rooms/Hallway.png") #
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
	"robert": preload("res://Assets/characters/robert4.png"),
	"mia": preload("res://Assets/characters/mia.png"),
	"janice": preload("res://Assets/characters/Janice.png"),
	"jim": preload("res://Assets/characters/jim2.png"),
	"jani": preload("res://Assets/characters/janitor.png"),
	"sandi": preload("res://Assets/characters/ppeperson1.png"), #
	"cheg": preload("res://Assets/characters/security.png"),
	"johan": preload("res://Assets/characters/Janice.png"), #
	"angelo": preload("res://Assets/characters/angelo.png"),
	"kyle": preload("res://Assets/characters/pressureSurgeon.png"), 
	"phelicia": preload("res://Assets/characters/mia.png"),
	"craig": preload("res://Assets/characters/surgeon.png"),
	"hilda": preload("res://Assets/characters/jim1.png"), #
	"skye": preload("res://Assets/characters/skye.png")
}

var Junctions

func _enter_tree() -> void:
	var reception = defineJunction("reception",[0,1,3],["patient1","hallway","receptionDesk"],["janice","jim"])
	var receptionDesk = defineJunction("receptionDesk",[1,3,4],["reception","patient1","hallway"],["skye"])
	var patient1 = defineJunction("patient1",[3,4],["receptionDesk","patient2"],["mia","robert"])
	var patient2 = defineJunction("patient2",[6],["patient1"],["kyle"])
	var hallway = defineJunction("hallway",[0,2,3,4,6,7],["surgery","admin","cafeteria","breakroom","reception","bathroom"],["cheg"])
	var bathroom = defineJunction("bathroom",[1],["hallway"],["jim"])
	var surgery = defineJunction("surgery",[7],["hallway"],["johan","criag"])
	var breakroom = defineJunction("breakroom",[5],["hallway"],["jani"])
	var cafeteria = defineJunction("cafeteria",[3],["hallway"],["jani"])
	var admin = defineJunction("admin",[3,7],["morgue","hallway"],["hilda","sandi"])
	var morgue = defineJunction("morgue",[0,1,7],["admin","lab","admin"],["angelo"])
	var lab = defineJunction("lab",[7],["morgue"],["phelicia"])
	Junctions = {
		"reception" : reception,
		"receptionDesk" : receptionDesk,
		"patient1" : patient1,
		"patient2" : patient2,
		"hallway" : hallway,
		"bathroom" : bathroom ,
		"surgery" : surgery,
		"breakroom" : breakroom,
		"cafeteria" : cafeteria,
		"admin" : admin,
		"morgue" : morgue,
		"lab" : lab,
	}
	
	activeJunction = Junctions["reception"]
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
	

	
