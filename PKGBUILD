# Maintainer: Sri Rang <sri@shapemachine.xyz>
pkgname=castword-gnome-bin
# pkgver uses dots; the git tag uses hyphens (e.g. v2026-04-04-00)
pkgver=2026.04.07.00
pkgrel=1
pkgdesc="GNOME overlay for LLM-powered text tone rewriting"
arch=('any')
url="https://shapemachine.xyz/castword"
license=('custom')
depends=(
    'python'
    'python-gobject'
    'libadwaita'
    'libsecret'
    'gtk4'
)
provides=('castword-gnome')
conflicts=('castword-gnome')
install=castword-gnome-bin.install
_fullver=2026-04-07-00
source=("$pkgname-$_fullver.pkg.tar.zst::https://github.com/Shape-Machine/castword-gnome/releases/download/v$_fullver/castword-gnome-$_fullver-any.pkg.tar.zst")
sha256sums=('ddb4c5445d3e37a71c4d29fcc41c77c6e8c7d4261fb6075305e69e3a71fbbc0a')

package() {
    cp -r "$srcdir/usr" "$pkgdir/"
}
