class_name Player
extends CharacterBody2D

#region /// onready
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var damage_shape: CollisionShape2D = $DamageArea/Damage_shape
@onready var g_o : PackedScene = preload("res://Character_Sprites/game_over.tscn")
#endregion

#region /// state references
var states : Array[PlayerState]
var current_state : PlayerState : 
	get : return states.front()
var previous_state : PlayerState :
	get: return states[1]
#endregion

#region /// standard var
var direction : Vector2 = Vector2.ZERO
var gravity : float = 980

var health: float = 100.0
var fall_start_y: float = 0.0
var was_on_floor: bool = true
var fall_distance: int 
#endregion

#region /// export var
@export var move_speed : float = 100
#endregion


func _ready() -> void:
	#init states
	initialize_states()
	pass

func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.handle_input(event))
	pass

func _process(_delta: float) -> void:
	update_direction()
	change_state(current_state.process(_delta))
	pass

func _physics_process(_delta: float) -> void:
	velocity.y += gravity * _delta
	move_and_slide()
	change_state(current_state.physics_process(_delta))
	pass

func initialize_states() -> void:
	states = []
	#gather states
	for c in $States.get_children():
		if c is PlayerState:
			states.append( c )
			c.player = self
		pass
		
	if states.size() == 0:
		return
		
	#init all states
	for state in states:
		state.init()
		
	#set first state
	change_state(current_state)
	current_state.enter()
	pass

func change_state(new_state: PlayerState) -> void:
	if new_state == null:
		return
	elif new_state == current_state:
		return
	
	
	if current_state:
		current_state.exit()
	
	states.push_front(new_state)
	current_state.enter()
	states.resize(3)
	pass

func update_direction() -> void:
	var prev_dir : Vector2 = direction
	
	direction = Input.get_vector("Left", "Right", "Jump", "Interact")
	
	if prev_dir.x != direction.x:
		if direction.x < 0:
			animated_sprite_2d.flip_h = true
		elif direction.x > 0:
			animated_sprite_2d.flip_h = false
pass
