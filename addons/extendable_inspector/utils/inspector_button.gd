extends Button

var inspector_plugin

func _init(_inspector_plugin):
	inspector_plugin = _inspector_plugin

func _pressed():
	inspector_plugin.refresh_inspector()
