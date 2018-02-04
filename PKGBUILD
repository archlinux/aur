# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=vt
pkgver=0.5772
pkgrel=2
pkgdesc="A tool set for short variant discovery in genetic sequence data"
arch=('i686' 'x86_64')
url=https://github.com/atks/"${pkgname}"
license=('GPL3')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/atks/"${pkgname}"/archive/"${pkgver}".tar.gz)
sha256sums=('b147520478a2f7c536524511e48133d0360e88282c7159821813738ccbda97e7')

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  make
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
}
