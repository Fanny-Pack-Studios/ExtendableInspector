extends Button

var object
var inspector_plugin

func _init(_object,_inspector_plugin):
	object = _object
	inspector_plugin = _inspector_plugin

func on_press_do(method_name, binds = [], flags = 0):
	pressed.connect(Callable(object,method_name).bindv(binds),flags)

