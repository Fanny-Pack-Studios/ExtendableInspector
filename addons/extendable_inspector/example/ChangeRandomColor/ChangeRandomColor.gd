@tool
extends Node3D

func change_random_color(params):
	$CSGBox3D.material.albedo_color = Color(randf(), randf(), randf())

func _extend_inspector_begin(inspector: ExtendableInspector):
	var common_controls = CommonControls.new(inspector)
	inspector.add_custom_control(
		common_controls.method_button("change_random_color")
	)
