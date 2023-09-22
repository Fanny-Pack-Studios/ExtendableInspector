# Extendable Inspector

Makes it easier to add custom inspector controls to nodes.

![Screenshot showing the example code in res://addons/extendable_inspector/example/ChangeRandomColor/ChangeRandomColor.gd](https://user-images.githubusercontent.com/11432672/215778616-963d902e-acc8-493c-969d-3544926a4904.png)
![3d scene of a cube with a button in the inspector that says 'Change Random Color'](https://user-images.githubusercontent.com/11432672/215778698-f09496c1-a9ff-4a60-99d0-2ae5cee6ab71.png)
![3d scene of same cube with a button in the inspector that says 'Change Random Color' but now the cube is of a different color](https://user-images.githubusercontent.com/11432672/215778730-78761e6d-5232-425f-acf8-1f34c5e7e614.png)

# How to install

Download the project and copy the addon folder into your godot project.

Go to Project Settings > Plugins, and enable Extendable Inspector.

# How to use

What this plugin does is allow extending the inspector by declaring some methods in the script for which you want to add custom extensions to the inspector.

The supported methods are analogous to methods that can be defined in an `EditorInspectorPlugin` to add new features to the inspector.
https://docs.godotengine.org/en/latest/classes/class_editorinspectorplugin.html#class-editorinspectorplugin-method-add-property-editor-for-multiple-properties

These methods are:
```godot
void _extend_inspector_begin(inspector: ExtendableInspector)
```
Allows adding controls at the beginning of the inspector.

```godot
void _extend_inspector_end(inspector: ExtendableInspector)
```

Allows adding controls at the end of the inspector.

```godot
bool _extend_inspector_category(inspector: ExtendableInspector, category: String)
```

Allows adding controls at the beginning of a category in the property list for object.

```godot
void _extend_inspector_property(inspector: ExtendableInspector, object: Object, type: int, name: String, hint_type: int, hint_string: String, usage_flags: int, wide: bool)
```

Allows adding property-specific editors to the property list for object. The added editor control must extend `EditorProperty`. Returning `true` removes the built-in editor for this property, otherwise allows to insert a custom editor before the built-in one.

## Examples

Examples can be found in the [example folder](https://github.com/Fanny-Pack-Studios/ExtendableInspector/tree/godot-4/addons/extendable_inspector/example)

## Utils

This plugin has a core folder that adds the functionality to let you extend the inspector with any custom control you define from your own scripts.
Apart from that, there's a `utils` folder that defines some already made controls that can be added to the inspector.
