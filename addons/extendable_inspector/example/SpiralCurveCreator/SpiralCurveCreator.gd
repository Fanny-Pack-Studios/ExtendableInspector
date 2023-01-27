tool
extends Spatial

export(float) var radius = 5
export(float) var height = 10
export(float) var amount_of_points = 10
var path

func draw_espiral():
	var curve: Curve3D = _path().curve
	curve.clear_points()
	var angle = 0
	var y = 0
	for i in range(1, amount_of_points):
		var x = radius * cos(angle)
		var z = radius * sin(angle)
		
		curve.add_point(Vector3(x, y, z))
		
		angle += PI/4
		y += (height / amount_of_points)

func _path():
	if(not has_node("Path")):
		path = Path.new()
		add_child(path)
		path.owner = get_tree().get_edited_scene_root()
	else:
		path = get_node("Path")
	return path

func _extend_inspector_begin(inspector: ExtendableInspector):
	var common_controls = CommonControls.new(inspector)
	inspector.add_custom_control(
		common_controls.method_button("draw_espiral")
	)

