# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=c
pkgver=0.11
pkgrel=1
pkgdesc='Compile and execute C "scripts" in one go'
arch=('any')
url="https://github.com/ryanmjacobs/c"
license=('MIT')
provides=('c')
conflicts=('c')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('19b932e0087acf6c639cc5a4fa9a0c87314e62b0561f5517fd7a78e32fb61801')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 775 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
