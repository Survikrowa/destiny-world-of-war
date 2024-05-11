extends Node

@export var initial_state: State

var current_state: State 
var states: Dictionary = {}


func _ready() -> void:
	var childrens = get_children() as Array[State]
	for child in childrens:
		states[child.name.to_lower()] = child
		child.Transitioned.connect(_on_child_transition)
	if initial_state:
		initial_state.Enter()
		current_state = initial_state


func _process(delta: float) -> void:
	if current_state:
		current_state.Update(delta)
		
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.Physics_Update(delta)

func _on_child_transition(state: State, new_state_name: String):
	if state != current_state:
		return
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.Exit()
		
	new_state.Enter()
	
	current_state = new_state
