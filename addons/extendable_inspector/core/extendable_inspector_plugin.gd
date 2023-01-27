class_name ExtendableInspector
extends EditorInspectorPlugin

const InspectorButton = preload("res://addons/extendable_inspector/utils/inspector_button.gd")

var object

func can_handle(an_object):
	var methods = [
		"_extend_inspector_begin",
		"_extend_inspector_end",
		"_extend_inspector_property",
		"_extend_inspector_category"
		]
	for method in methods:
		if an_object.has_method(method):
			object = an_object
			return true
	return false

func parse_begin(_object):
	if(object.has_method("_extend_inspector_begin")):
		object._extend_inspector_begin(self)

func parse_end():
	if(object.has_method("_extend_inspector_end")):
		object._extend_inspector_end(self)	
	
func parse_category(_object, category: String):
	if(object.has_method("_extend_inspector_category")):
		object._extend_inspector_category(self, category)

func parse_property(_object, type: int, path: String, hint: int, hint_text: String, usage: int) -> bool:
	if(object.has_method("_extend_inspector_property")):
		return object._extend_inspector_property(self, type, path, hint, hint_text, usage) 
	return false

# Helpers

func get_editor_interface():
	return EditorPlugin.new().get_editor_interface()

func refresh_inspector():
	get_editor_interface().get_inspector().refresh()

