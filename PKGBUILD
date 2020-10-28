#Maintainer: Neve Laughery <RewoundVHS@protonmail.com>

pkgname=otb-scientifica
_gitname=scientifica
pkgver=2.1
pkgrel=5
pkgdesc='Tall and condensed bitmap font for geeks.'
arch=('any')
url="https://github.com/NerdyPepper/scientifica"
license=('SIL')
depends=()
makedepends=('git')
source=("https://github.com/NerdyPepper/scientifica/releases/download/v$pkgver/scientifica-v$pkgver.tar")
sha256sums=('SKIP')

package() {
	tar xvf "scientifica-v$pkgver.tar"

    install -D -m644 "$_gitname/otb/scientifica.otb" "$pkgdir/usr/share/fonts/misc/scientifica.otb"
    install -D -m644 "$_gitname/otb/scientificaBold.otb" "$pkgdir/usr/share/fonts/misc/scientificaBold.otb"
    install -D -m644 "$_gitname/otb/scientificaItalic.otb" "$pkgdir/usr/share/fonts/misc/scientificaItalic.otb"
}
