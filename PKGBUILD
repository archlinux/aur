# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=c
pkgver=0.14
pkgrel=1
pkgdesc='Compile and execute C "scripts" in one go'
arch=('any')
url="https://github.com/ryanmjacobs/c"
license=('MIT')
provides=('c')
conflicts=('c')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2b66d79d0d5c60b8e6760dac734b8ec9a7d6a5e57f033b97086821b1985a870b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 775 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
