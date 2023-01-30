class_name CommonControls
extends Object

const InspectorButton = preload("res://addons/extendable_inspector/utils/inspector_button.gd")

var inspector

func _init(_inspector):
	inspector = _inspector

func inspector_button() -> InspectorButton:
	return InspectorButton.new(inspector.object, inspector)

func labeled_button(text) -> InspectorButton:
	var button = inspector_button()
	button.text = text
	return button

func method_button(method_name, params = []) -> InspectorButton:
	var button = labeled_button(method_name.capitalize())
	button.pressed.connect(Callable(inspector.object,method_name).bind(params))
	return button
