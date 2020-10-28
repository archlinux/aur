#Maintainer: Neve Laughery <RewoundVHS@protonmail.com>

pkgname=scientifica-bdf
_gitname=scientifica
pkgver=2.1
pkgrel=7
pkgdesc='Tall and condensed bitmap font for geeks.'
arch=('any')
url="https://github.com/NerdyPepper/scientifica"
license=('SIL')
depends=()
makedepends=()
source=("https://github.com/NerdyPepper/scientifica/releases/download/v$pkgver/scientifica-v$pkgver.tar")
sha256sums=('SKIP')

package() {
	tar xvf "scientifica-v$pkgver.tar"

	install -D -m644 "$_gitname/bdf/scientifica-11.bdf" "$pkgdir/usr/share/fonts/misc/scientifica-11.bdf"
	install -D -m644 "$_gitname/bdf/scientificaBold-11.bdf" "$pkgdir/usr/share/fonts/misc/scientificaBold-11.bdf"
	install -D -m644 "$_gitname/bdf/scientificaItalic-11.bdf" "$pkgdir/usr/share/fonts/misc/scientificaItalic-11.bdf"
}
