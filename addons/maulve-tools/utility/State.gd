@icon("../icons/state.svg")
extends Node
class_name State

@onready var state_machine : StateMachine

@onready var parent : Node

## A function that triggers when entering the State
func enter() -> void:
	pass

## A function that triggers when exiting the State
func exit() -> void:
	pass

## Process function that triggers every process frame (display frame)
func process(_delta: float) -> void:
	pass

## Physics Process function that triggers every physics frame
func physics_process(_delta: float) -> void:
	pass

## Use this function to change to a new State.
## The name string must be the same as the name of the State Node you want to switch to.
func change_state(new_state_name : String) -> void:
	state_machine.change_state(self, new_state_name)
