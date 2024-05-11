extends State
class_name RunState

@export var player: Player
@onready var animated_sprite = $"../../CharacterBody2D/AnimatedSprite2D"
const BLEND_POSITION_RUN_PATH = "parameters/run/run_bs2d/blend_position"

func Physics_Update(delta: float):
	if player.get_input_vector() == Vector2.ZERO:
		Transitioned.emit(self, "IdleState")
		return
	move(delta)

func move(delta: float):
	player.animation_tree.set(BLEND_POSITION_RUN_PATH, player.blend_position)
	apply_movement(player.get_input_vector() * player.BASIC_SPEED * player.ACCELERATION * delta)
	flip_sprite()
	player.move_and_slide()

func apply_movement(amount: Vector2) -> void:
	player.set_blend_position(player.get_input_vector())
	if(amount.normalized().x > player.MAX_SPEED || amount.normalized().y > player.MAX_SPEED):
		player.velocity = player.MAX_SPEED
	else:
		player.velocity = amount

func flip_sprite():
	var direction: Vector2
	if Input.is_action_pressed("move_left"):
		direction = Vector2.LEFT
	if Input.is_action_pressed("move_right"):
		direction = Vector2.RIGHT
	animated_sprite.flip_h = direction == Vector2.LEFT
	
