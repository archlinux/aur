# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=vt
pkgver=0.5772
pkgrel=1
pkgdesc="A tool set for short variant discovery in genetic sequence data. "
arch=('i686' 'x86_64')
url="https://github.com/atks/vt"
license=('GPL3')
depends=('')
provides=('vt')
conflicts=('vt')
source=(https://github.com/atks/"${pkgname}"/archive/"${pkgver}".tar.gz)
md5sums=('5815fca9bfd1c56563a57db0927767e7')

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  make
}

package() {
  mkdir -p "${pkgdir}"/usr/bin/

  cp "${srcdir}"/"${pkgname}"-"${pkgver}"/vt "${pkgdir}"/usr/bin/vt
}
