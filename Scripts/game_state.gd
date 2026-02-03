extends Node

static var gameState: Dictionary = {
	"worldState": {
		"junction": {
			"name": {},
			"npcCount": {},
			"canCommunicate": {},
			"roomObject": "",
			"nearby": {}
		},
		"npc": {
			"name": {},
			"dialog": {
				# leave empty if line is not a conversation option
				"playerOptions": {}
			},
			"room": {}
		},
		"player": {
			
		}
	}
}


func onGlobalStateChange():
	pass
	#write to global state

static var stateTemp: Dictionary = {
	"worldState": {
		"Junctions" : [], # [dictionarty : junction]
		"time": {},
		"date": {}
	},
	"npc": {
		"name": {},
		"dialog": {
			# leave empty if line is not a conversation option
			"playerOptions": {}
		}
	}
}


var playerNpcInfo = {
		"hasEncountered" : false,
		"dialoguePosition" : 0,
		"dialoguePathIDs" : [],
		"disposition" : 50
}

#var NPC_NAMES = ["janice","robert","jim","mia", "jani", "sandi","cheg", "johan", "angelo", "kyle", "phelicia", "craig", "hilda", "skye"] 

var playerEncounters = {
	"npcs" : {
		"janice": playerNpcInfo.duplicate(),
		"robert": playerNpcInfo.duplicate(),
		"jim": playerNpcInfo.duplicate(),
		"mia": playerNpcInfo.duplicate(),
		 "jani": playerNpcInfo.duplicate(),
		 "sandi": playerNpcInfo.duplicate(),
		"cheg": playerNpcInfo.duplicate(),
		 "johan": playerNpcInfo.duplicate(),
		 "angelo": playerNpcInfo.duplicate(),
		 "kyle": playerNpcInfo.duplicate(),
		 "phelic": playerNpcInfo.duplicate(),
		 "craig": playerNpcInfo.duplicate(),
		 "hilda": playerNpcInfo.duplicate(),
		 "skye": playerNpcInfo.duplicate()
	}
}
