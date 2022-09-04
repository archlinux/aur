from .ApplyModifierForObjectWithShapeKeys import *

bl_info = {
    "name":         "Apply modifier for object with shape keys",
    "author":       "Przemysław Bągard, additonal contributions by Iszotic, updated to 2.93 by Fro Zen",
    "blender":      (2,93,0),
    "version":      (0,2,1),
    "location":     "Context menu",
    "description":  "Apply modifier and remove from the stack for object with shape keys (Pushing 'Apply' button in 'Object modifiers' tab result in an error 'Modifier cannot be applied to a mesh with shape keys').",
    "category":     "Object Tools > Multi Shape Keys"
}

if __name__ == "__main__":
    register()
