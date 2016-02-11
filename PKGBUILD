# Maintainer: Christoph Vigano <mail@cvigano.de>
pkgname=passdmenu
pkgver=1.1.1
pkgrel=1
pkgdesc="A dmenu frontend to pass with clipboard and autotype functionality for user and password."
arch=(any)
url="https://github.com/klaasb/passdmenu"
license=('custom')
provides=('passdmenu')
conflicts=('passdmenu-git')
depends=('python' 'xclip' 'dmenu')
optdepends=('xdotool: autotype functionality')
source=("https://github.com/klaasb/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5e521b330ff6f5a4f3e2746d4bf245f1f2264044f04d783bd8f135eb16ec8b76')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 passdmenu.py "${pkgdir}/usr/bin/passdmenu"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
sha256sums=('5e521b330ff6f5a4f3e2746d4bf245f1f2264044f04d783bd8f135eb16ec8b76')
sha256sums=('640bc56e7ac9a77362455a24d26dbfa825c97c163b94ec096f71ed979d21b93d')
