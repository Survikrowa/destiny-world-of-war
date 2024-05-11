extends CharacterBody2D
class_name Player

@export var BASIC_SPEED = 400
@export var MAX_SPEED = 10000
@export var ACCELERATION = 10

@onready var animation_tree = $AnimationTree
@onready var animation_tree_state_machine = animation_tree.get("parameters/playback")


var blend_position: Vector2 = Vector2.ZERO

func get_input_vector() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")

func set_blend_position(input_vector: Vector2) -> void:
	blend_position = input_vector
