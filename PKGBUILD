# Maintainer: Sri Rang <sri@shapemachine.xyz>
pkgname=castword-gnome-bin
# pkgver uses dots; the git tag uses hyphens (e.g. v2026-04-04-00)
pkgver=2026.04.04.04
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
_fullver=2026-04-04-04
source=("$pkgname-$_fullver.pkg.tar.zst::https://github.com/Shape-Machine/castword-gnome/releases/download/v$_fullver/castword-gnome-$_fullver-any.pkg.tar.zst")
sha256sums=('202fb260803bb407ed15fe3c9f8135b95b13223b4f4d756cbb9c66ff03a1be07')

package() {
    cp -r "$srcdir/usr" "$pkgdir/"
}
