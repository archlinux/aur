# Maintainer: Shape Machine <tusk.gnome@shapemachine.xyz>
pkgname=tusk-gnome-bin
pkgver=2026.04.01.00
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
_fullver=2026.04.01-00
source=("$pkgname-$_fullver.pkg.tar.zst::https://github.com/Shape-Machine/tusk-gnome/releases/download/v$_fullver/tusk-gnome-$_fullver-any.pkg.tar.zst")
sha256sums=('c95dd72481151077855cbf6b5a6a88d10c2fad872533118a8dba5294bceafe55')

package() {
    cp -r "$srcdir/usr" "$pkgdir/"
}
