# Maintainer: Shape Machine <tusk.gnome@shapemachine.xyz>
pkgname=tusk-gnome-bin
pkgver=2026.04.16.00
pkgrel=1
pkgdesc='PostgreSQL client for GNOME'
arch=('any')
url='https://github.com/Shape-Machine/tusk-gnome'
license=('custom')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'python-keyring'
    'gtksourceview5'
    'python-paramiko'
)
provides=('tusk-gnome')
conflicts=('tusk-gnome')
_fullver=2026.04.16-00
source=("$pkgname-$_fullver.pkg.tar.zst::https://github.com/Shape-Machine/tusk-gnome/releases/download/v$_fullver/tusk-gnome-$_fullver-any.pkg.tar.zst")
sha256sums=('c792eaed73ee7d14dca9edc0b5bff1d291b03c97d7b7ac90e6accd7e4b0ac295')

package() {
    cp -r "$srcdir/usr" "$pkgdir/"
}
