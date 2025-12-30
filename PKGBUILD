# Maintainer: T-1990 <address at domain dot>

pkgname=ttf-piboto
pkgver=1.2
pkgrel=1
pkgdesc='Piboto is a fork of Roboto before the 2014 redesign.'
url="https://github.com/thunderbird-1990/fonts-piboto"
license=(custom:OFL)
arch=(any)
makedepends=('git')

source=("git+https://github.com/thunderbird-1990/fonts-piboto.git")
md5sums=('SKIP')

package() {
	install -Dm644 "$srcdir/fonts-piboto/ttf/"*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
}
