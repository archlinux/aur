# Installation Directory
export MOONRAY_ROOT=/opt/moonray

# adds the Arras runtime execComp to the path
export PATH=$MOONRAY_ROOT/bin:${PATH}

# tells MoonRay where to find shader dsos
export RDL2_DSO_PATH=$MOONRAY_ROOT/rdl2dso.proxy:$MOONRAY_ROOT/rdl2dso
# tells the Sdr plugins where to find the shader descriptions
export MOONRAY_ROOT_CLASS_PATH=$MOONRAY_ROOT/shader_json
# tells Arras where to find the session definition files
export ARRAS_SESSION_PATH=$MOONRAY_ROOT/sessions
# adds the pxr plugins to the plugin path
export PXR_PLUGINPATH_NAME=$MOONRAY_ROOT/plugin/usd:${PXR_PLUGINPATH_NAME}
export PXR_PLUGIN_PATH=$MOONRAY_ROOT/plugin/usd:${PXR_PLUGIN_PATH}
