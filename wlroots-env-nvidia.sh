# Wayland Variables for NVIDIA to work correctly
# ! RUNNING THIS FILE DOESN'T DO ANYTHING
# ! PLEASE SOURCE THIS FILE BEFORE STARTING ANY WLROOTS-BASED COMPOSITOR

# Hardware cursors not yet working on wlroots
export WLR_NO_HARDWARE_CURSORS=1
# Set wlroots renderer to Vulkan to avoid flickering
export WLR_RENDERER=vulkan
# General wayland environment variables
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# Firefox wayland environment variable
export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1
# OpenGL Variables
export GBM_BACKEND=nvidia-drm
export __GL_GSYNC_ALLOWED=0
export __GL_VRR_ALLOWED=0
export __GLX_VENDOR_LIBRARY_NAME=nvidia
# Xwayland compatibility
export XWAYLAND_NO_GLAMOR=1
