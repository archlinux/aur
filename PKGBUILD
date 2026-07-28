# Maintainer: Mimogu <mimogu1@proton.me>
pkgname=mahmoud-presser
pkgver=1.1.0
pkgrel=1
pkgdesc="Modern Cross-Platform Auto-Clicker, Macro Sequence Builder & Auto-Typer"
arch=('any')
url="https://github.com/Mimogu/mahmoud-presser"
license=('GPL')
depends=('python' 'python-pyqt6' 'python-pynput' 'python-evdev' 'python-gobject')
source=("linux_clicker.py"
        "mahmoud-presser.desktop")
sha256sums=('SKIP'
            'SKIP')

package() {
    # Install the main Python script as an executable in /usr/bin/
    install -Dm755 "${srcdir}/linux_clicker.py" "${pkgdir}/usr/bin/mahmoud-presser"
    
    # Install the desktop shortcut for application menus
    install -Dm644 "${srcdir}/mahmoud-presser.desktop" "${pkgdir}/usr/share/applications/mahmoud-presser.desktop"
}
