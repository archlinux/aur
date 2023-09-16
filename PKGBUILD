# Maintainer: Christopher Schnick <crschnick@xpipe.io>

pkgname="pdx-unlimiter"
pkgver="2.13.2"
pkgrel=1
pkgdesc="A smart savegame manager, editor, and toolbox for all current major Paradox Grand Strategy games."
arch=('x86_64')
url="https://github.com/crschnick/pdx_unlimiter"
license=('GPL3')
provides=("$pkgname")
source=("Pdx-Unlimiter.desktop" "https://github.com/crschnick/pdx_unlimiter/releases/download/${pkgver}/pdx_unlimiter-linux.zip")
sha512sums=("SKIP" "SKIP")

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a "$srcdir/" "$pkgdir/opt/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/Pdx-Unlimiter.desktop"
}

