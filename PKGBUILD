# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Ian Denhardt <ian@zenhack.net>

pkgname=keyringer
pkgver=0.5.3
pkgrel=1
pkgdesc="Encrypted and distributed secret sharing software"
arch=('any')
url="https://keyringer.pw"
license=('GPL3')
depends=('gnupg' 'git')
source=("https://keyringer.pw/releases/${pkgname}-${pkgver}.tar.bz2"
        "https://keyringer.pw/releases/${pkgname}-${pkgver}.tar.bz2.asc")
sha256sums=('8a4a5da7cee57732fd9d7056499c0020a262f6becdd39716db811722e70b7ab5'
            'SKIP')
validpgpkeys=("4FA73DE89ADE75998AC24E97B8C1D523FE7AAA84")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
