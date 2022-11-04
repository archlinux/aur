#
# Parameters for JOSM editor
#
# You may want to extend the memory for josm with something like this as additional parameters
# -Xmx800M

#Required by josm-developers for some functionality, see https://bugs.archlinux.org/task/72953
JOSM_ARGS="--add-opens=java.desktop/javax.swing.text.html=ALL-UNNAMED"
