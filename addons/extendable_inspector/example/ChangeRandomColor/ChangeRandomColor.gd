@tool
extends Node3D

func change_random_color():
	$CSGBox3D.material.albedo_color = Color(randf(), randf(), randf())

func _extend_inspector_begin(inspector: ExtendableInspector):
	var change_random_color_button =\
		CommonControls.new(inspector).method_button("change_random_color")

	inspector.add_custom_control(change_random_color_button)
