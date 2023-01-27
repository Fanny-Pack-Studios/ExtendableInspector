tool
extends Spatial

func change_random_color():
	$CSGBox.material.albedo_color = Color(randf(), randf(), randf())

func _extend_inspector_begin(inspector: ExtendableInspector):
	var common_controls = CommonControls.new(inspector)
	inspector.add_custom_control(
		common_controls.method_button("change_random_color")
	)
