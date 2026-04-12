# Maintainer: Shape Machine <tusk.gnome@shapemachine.xyz>
pkgname=tusk-gnome-bin
pkgver=2026.04.12.02
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
_fullver=2026.04.12-02
source=("$pkgname-$_fullver.pkg.tar.zst::https://github.com/Shape-Machine/tusk-gnome/releases/download/v$_fullver/tusk-gnome-$_fullver-any.pkg.tar.zst")
sha256sums=('2624871d3d766711e869877954e319b7390d9ee393a3e0c76c8123f190c54192')

package() {
    cp -r "$srcdir/usr" "$pkgdir/"
}
