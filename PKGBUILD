# Maintainer: Nacho Telmo ignacioezcurra37@gmail.com.ar
pkgname=sinergia-reflector-top
pkgver=1.0.2
pkgrel=1
pkgdesc="Aplicación gráfica en Python y Tkinter para optimizar los espejos de Arch Linux usando Reflector"
arch=('any')
url="https://github.com/Nacho-Telmo/Sinergia-Reflector-Top"
license=('GPL3')
depends=('python' 'tk' 'reflector' 'polkit')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v1.0.1.tar.gz")
sha256sums=('fc4ab0f0e63c438640f72cb5240b68d2a2103f85e500bdfa6843b5aa27617301')

package() {
    cd "Sinergia-Reflector-Top-1.0.1"
    install -Dm755 reflector_gui.py "$pkgdir/usr/bin/sinergia-reflector-top"
    install -Dm644 "$startdir/sinergia-reflector-top.desktop" "$pkgdir/usr/share/applications/sinergia-reflector-top.desktop"
}

