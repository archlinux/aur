# Parameters for JOSM editor

#FS#72953 https://bugs.archlinux.org/task/72953
JOSM_ARGS="--add-opens=java.desktop/javax.swing.text.html=ALL-UNNAMED"

# https://josm.openstreetmap.de/ticket/21059
JAVA_VERSION=$(java -version 2>&1 | head -n1 | awk -F'"' '{print $2}' | awk -F'.' '{print $1}')
if [[ "${JAVA_VERSION}" -ge 11 ]]; then
    JOSM_ARGS="$JOSM_ARGS --add-exports=java.base/sun.security.action=ALL-UNNAMED"
    JOSM_ARGS="$JOSM_ARGS --add-exports=java.desktop/com.sun.imageio.plugins.jpeg=ALL-UNNAMED"
    JOSM_ARGS="$JOSM_ARGS --add-exports=java.desktop/com.sun.imageio.spi=ALL-UNNAMED"
fi
