extends State
class_name IdleState

@export var player: Player

const BLEND_POSITION_IDLE_PATH = "parameters/idle/idle_bs2d/blend_position"

func Physics_Update(delta: float):
	var player_input_vector = player.get_input_vector()
	player.set_blend_position(player.blend_position)	
	player.animation_tree.set(BLEND_POSITION_IDLE_PATH, player.blend_position)	
	if player_input_vector != Vector2.ZERO:
		player.animation_tree_state_machine.travel("run")
		Transitioned.emit(self, "RunState")
	else:
		player.animation_tree_state_machine.travel("idle")
