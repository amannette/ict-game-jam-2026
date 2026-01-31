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
