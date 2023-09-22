class_name CommonControls
extends Object

const InspectorButton = preload("res://addons/extendable_inspector/utils/inspector_button.gd")

var inspector

func _init(_inspector):
	inspector = _inspector

func _target():
	return inspector.object

func labeled_button(text) -> InspectorButton:
	var button = InspectorButton.new(inspector)
	button.text = text
	return button

func method_button(method_name, params = []) -> InspectorButton:
	var button = labeled_button(method_name.capitalize())
	button.connect("pressed", _target(), method_name, params)
	return button
