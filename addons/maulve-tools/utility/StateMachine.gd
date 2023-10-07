@icon("../icons/statemachine.svg")
## A simple state machine
extends Node
class_name StateMachine

signal transitioned(old_state, new_state)

## A dictionary of all loaded States
var states : Dictionary = {}

## The current State
var current_state : State

## The initial State
@export var initial_state : State

## Reference to Parent that all States of this StateMachine can use
@export var parent : Node

func _ready() -> void:
	
	# Adds all children of type State to states Dictionary
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.state_machine = self
			if parent != null:
				child.parent = parent
	
	if initial_state == null:
		printerr("Maulve Tools: StateMachine initial state not set.")
	
	current_state = initial_state
	current_state.enter()

func _process(delta: float) -> void:
	if current_state:
		current_state.process(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_process(delta)

## Function used by States to change to a different State
func change_state(old_state : State, new_state_name : String) -> void:
	if old_state == null or states[new_state_name] == null:
		return
	
	old_state.exit()
	
	var new_state = states[new_state_name] as State
	new_state.enter()
	
	current_state = new_state
	
	transitioned.emit(old_state, new_state)
