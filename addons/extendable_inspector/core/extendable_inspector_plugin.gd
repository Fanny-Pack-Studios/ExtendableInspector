@tool
class_name ExtendableInspector
extends EditorInspectorPlugin

const InspectorButton = preload("res://addons/extendable_inspector/utils/inspector_button.gd")

var object

func _can_handle(an_object):
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

func _parse_begin(_object):
	print("parse begin")
	if(object.has_method("_extend_inspector_begin")):
		object._extend_inspector_begin(self)

func _parse_end(_object):
	if(object.has_method("_extend_inspector_end")):
		object._extend_inspector_end(self)	
	
func _parse_category(_object, category: String):
	if(object.has_method("_extend_inspector_category")):
		object._extend_inspector_category(self, category)

func _parse_property(object: Object, type: int, name: String, hint_type: int, hint_string: String, usage_flags: int, wide: bool) -> bool:
	if(object.has_method("_extend_inspector_property")):
		return object._extend_inspector_property(self, type, name, hint_type, hint_string, usage_flags, wide) 
	return false

# Helpers

func get_editor_interface():
	return EditorPlugin.new().get_editor_interface()


