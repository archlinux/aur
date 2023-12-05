# Maintainer: Christopher Schnick <crschnick@xpipe.io>
# Co-maintainer: Markus Hartung <mail@hartmark.se>

pkgname="pdx-unlimiter"
pkgver="2.13.8"
pkgrel=1
pkgdesc="A smart savegame manager, editor, and toolbox for all current major Paradox Grand Strategy games."
arch=('x86_64')
url="https://github.com/crschnick/pdx_unlimiter"
license=('GPL3')
provides=("$pkgname")
source=("Pdx-Unlimiter.desktop" "https://github.com/crschnick/pdx_unlimiter/releases/download/${pkgver}/pdx_unlimiter-linux.zip")
sha512sums=('482eea1c7cbb558fb366c9232e56fdcc27a676d87419f4e895e1a1c6530c246d0b32098f1e97990f8ee7676e6075a64e6d853cfd214889171c4126d3cb50539f'
            'ae6c4b22e4e7d254bc36e490ca965ddaa6bdd7f08444f5f0452a3b591c0fe873f5aa1fc476fee78055a56d162b4cf1c79ed9e7586d536d1c24410b2ffe670777')

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a "$srcdir/" "$pkgdir/opt/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/Pdx-Unlimiter.desktop"
}

