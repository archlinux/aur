# Maintainer: TutorNachhilfe
pkgname=gnome-classshare
pkgver=1.0.0
pkgrel=1
pkgdesc="Dateien teilen und einsammeln im Schulnetz (GNOME)"
arch=('any')
url="https://github.com/TutorNachhilfe/gnome-classshare"
license=('GPL3')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'python-pillow'
)
optdepends=(
    'python-qrcode: QR-Code-Anzeige'
)
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
    : # nichts zu kompilieren
}

package() {
    cd "$srcdir/gnome-classshare"
    make install DESTDIR="$pkgdir" PREFIX=/usr
}
