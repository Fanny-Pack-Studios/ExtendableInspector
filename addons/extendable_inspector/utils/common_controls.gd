class_name CommonControls
extends Object

var inspector

func _init(_inspector):
	inspector = _inspector

func _target():
	return inspector.object

func labeled_button(text) -> Button:
	var button = Button.new()
	button.text = text
	return button

func method_button(method_name, params = []) -> Button:
	var button = labeled_button(method_name.capitalize())
	button.pressed.connect(func(): _target().callv(method_name, params))
	return button
