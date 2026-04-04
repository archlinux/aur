# Maintainer: Sri Rang <sri@shapemachine.xyz>
pkgname=castword-gnome-bin
# pkgver uses dots; the git tag uses hyphens (e.g. v2026-04-04-00)
pkgver=2026.04.04.03
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
_fullver=2026-04-04-03
source=("$pkgname-$_fullver.pkg.tar.zst::https://github.com/Shape-Machine/castword-gnome/releases/download/v$_fullver/castword-gnome-$_fullver-any.pkg.tar.zst")
sha256sums=('bf1d3e43a7aab2ef771763db3abcad1122793293f50f6b7aa73394e562b31969')

package() {
    cp -r "$srcdir/usr" "$pkgdir/"
}
