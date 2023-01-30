@tool
extends EditorPlugin

const ExtendableInspectorPlugin = preload("./core/extendable_inspector_plugin.gd")

var extendable_inspector_plugin

func _enter_tree():
	extendable_inspector_plugin = ExtendableInspectorPlugin.new()
	add_inspector_plugin(extendable_inspector_plugin)


func _exit_tree():
	remove_inspector_plugin(extendable_inspector_plugin)
	extendable_inspector_plugin.free()
