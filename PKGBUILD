# Maintainer: Christopher Schnick <crschnick@xpipe.io>
# Co-maintainer: Markus Hartung <mail@hartmark.se>

pkgname="pdx-unlimiter"
pkgver="2.13.16"
pkgrel=2
pkgdesc="A smart savegame manager, editor, and toolbox for all current major Paradox Grand Strategy games."
arch=('x86_64')
url="https://github.com/crschnick/pdx_unlimiter"
license=('GPL3')
provides=("$pkgname")
source=("Pdx-Unlimiter.desktop" "https://github.com/crschnick/pdx_unlimiter/releases/download/${pkgver}/pdx_unlimiter-linux.zip")
sha512sums=('482eea1c7cbb558fb366c9232e56fdcc27a676d87419f4e895e1a1c6530c246d0b32098f1e97990f8ee7676e6075a64e6d853cfd214889171c4126d3cb50539f'
            'c5123a0d47ca7846c466364d20ed9e1e3bc599c5d965f598c7a1d558dbaa8249882f6ddebe400890981511b122c67de0a132513e912564ad23310a53a1515a76')

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a "$srcdir/" "$pkgdir/opt/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/Pdx-Unlimiter.desktop"
}

