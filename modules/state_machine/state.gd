extends Node
class_name State

signal Transitioned(state: State, new_state_name: String)

func Enter(): 
	pass
	
func Physics_Update(_delta: float):
	pass

func Exit():
	pass
	
func Update(_delta: float):
	pass
