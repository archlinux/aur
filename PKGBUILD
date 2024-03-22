pkgname=script-runner-gui
pkgver=1.1.0
pkgrel=4
pkgdesc="A GUI application for running and managing shell scripts"
arch=('any')
url="https://github.com/LORDINFINITY12/script-runner-gui"
license=('GPL')
depends=('python' 'python-pyqt5' 'vim')
source=("https://github.com/LORDINFINITY12/script-runner-gui/blob/main/script-runner-gui.py" "https://github.com/LORDINFINITY12/script-runner-gui/blob/main/script-runner-gui.desktop" "https://github.com/LORDINFINITY12/script-runner-gui/blob/main/scripts.json" "https://github.com/LORDINFINITY12/script-runner-gui/blob/main/script-runner-icon.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP') # Replace with actual sha256sums or use 'SKIP'

package() {
    cd "$srcdir"
    install -Dm755 "$srcdir/script-runner-gui.py" "$pkgdir/usr/bin/script-runner-gui"
    install -Dm644 "$srcdir/script-runner-gui.desktop" "$pkgdir/usr/share/applications/script-runner-gui.desktop"
    install -Dm644 "$srcdir/scripts.json" "$pkgdir/usr/share/script-runner-gui/scripts.json"
    install -Dm644 "$srcdir/script-runner-icon.png" "$pkgdir/usr/share/script-runner-gui/script-runner-icon.png"
}

