# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Ian Denhardt <ian@zenhack.net>

pkgname=keyringer
pkgver=0.5.4
pkgrel=1
pkgdesc="Encrypted and distributed secret sharing software"
arch=('any')
url="https://keyringer.pw"
license=('GPL3')
depends=('gnupg' 'git')
source=("https://keyringer.pw/releases/${pkgname}-${pkgver}.tar.bz2"
        "https://keyringer.pw/releases/${pkgname}-${pkgver}.tar.bz2.asc")
sha256sums=('45dc05f76fb08797d380ff2841a74ceec61936cfae2219d05b96b7733e349f83'
            'SKIP')
validpgpkeys=("4FA73DE89ADE75998AC24E97B8C1D523FE7AAA84")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
