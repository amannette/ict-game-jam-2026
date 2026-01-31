extends Node2D

@onready var characterSprite = $Sprite2D
@onready var collisionShape = $CollisionShape2D
# TODO: refer to gameState to assign sprite to character

# TODO: add click functionality by assigning a collisionShape2D

func assignSprite() -> void:
	# Temporarily hard coding a sprite path in here
	characterSprite.texture = preload("res://Assets/temp/doctor.png")
	# Assign a collision Shape to allow us to interact with character
	var spriteSize = characterSprite.texture.get_size()
	var spriteShape = RectangleShape2D.new()
	spriteShape.extents = spriteSize / 2.0
	#collisionShape.shape = spriteShape
	pass

func _ready() -> void:
	assignSprite()
