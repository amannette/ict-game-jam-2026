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
