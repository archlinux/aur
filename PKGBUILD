pkgname=jadx-gui-desktop-file
pkgver=1.0
pkgrel=1
pkgdesc='.desktop file for jadx-gui'
arch=('any')
license=('MIT')
depends=('jadx')

package() {
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/jadx-gui.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=JADX GUI
Exec=jadx-gui
Terminal=false
Type=Application
Categories=Development;
MimeType=application/java-archive;application/x-java-applet;
EOF
}
