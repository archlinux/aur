pkgname=hyprhide
pkgver=1.4
pkgrel=1
pkgdesc="A tool for hiding and showing windows in Hyprland using a PyQt6 GUI"
arch=('any')
url="https://github.com/KingVentrix007/hyprlandhide"
license=('MIT') 
depends=('python' 'python-pyqt6' 'hyprland' 'python-commentjson')
makedepends=()
source=('min.sh' 'HyprHideGui.py' 'config.cfg' 'min.py')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')  # You can replace SKIP with actual checksums later

package() {
    install -Dm755 "$srcdir/min.sh" "$pkgdir/usr/bin/hyprhide-min"
    install -Dm755 "$srcdir/HyprHideGui.py" "$pkgdir/usr/bin/hyprhide-gui"
    # install -Dm644 "$srcdir/hyprhide.desktop" "$pkgdir/usr/share/applications/hyprhide.desktop"
    install -Dm644 "$srcdir/config.cfg" "$pkgdir/usr/share/hyprhide/config.cfg"
    install -Dm644 "$srcdir/min.py" "$pkgdir/usr/share/hyprhide/min.py"

}
