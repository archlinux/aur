# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Ian Denhardt <ian at zenhack dot net>

pkgname=keyringer
pkgver=0.5.5
pkgrel=1
pkgdesc="Encrypted and distributed secret sharing software"
arch=('any')
url="https://keyringer.pw"
license=('GPL3')
depends=('gnupg' 'git')
source=("https://keyringer.pw/releases/${pkgname}-${pkgver}.tar.bz2"
        "https://keyringer.pw/releases/${pkgname}-${pkgver}.tar.bz2.asc")
sha256sums=('0569eeb38cd398e827cf4358f75f3ce0428072f759db17ae8da6c58a766c4182'
            'SKIP')
validpgpkeys=("4FA73DE89ADE75998AC24E97B8C1D523FE7AAA84")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
