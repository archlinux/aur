# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=c
pkgver=0.12
pkgrel=1
pkgdesc='Compile and execute C "scripts" in one go'
arch=('any')
url="https://github.com/ryanmjacobs/c"
license=('MIT')
provides=('c')
conflicts=('c')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9af9a67b8d92b77378bd679bc9274c200f2e8d07f5ed1ff459c6909f3a84a81d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 775 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
