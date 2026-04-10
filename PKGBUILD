# Maintainer: Sri Rang <sri@shapemachine.xyz>
pkgname=castword-gnome-bin
# pkgver uses dots; the git tag uses hyphens (e.g. v2026-04-04-00)
pkgver=2026.04.10.00
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
_fullver=2026-04-10-00
source=("$pkgname-$_fullver.pkg.tar.zst::https://github.com/Shape-Machine/castword-gnome/releases/download/v$_fullver/castword-gnome-$_fullver-any.pkg.tar.zst")
sha256sums=('846796c4692e08f95c612eccdabb023a86949a4698625df1cad3d8859543a3b1')

package() {
    cp -r "$srcdir/usr" "$pkgdir/"
}
