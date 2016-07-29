# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=pogo-optimizer
pkgver=1.3.2
pkgrel=1
pkgdesc='MITM data analysis utility for Pokemon GO'
arch=('any')
url='https://github.com/justinleewells/pogo-optimizer'
license=('GNU GPLv3+')
depends=(nodejs protobuf npm)
source=("https://github.com/justinleewells/pogo-optimizer/archive/v${pkgver}.tar.gz")
md5sums=('b0c98da64666d20fd54d40e24ac44098')

package() {
  cd "${srcdir}/pogo-optimizer-${pkgver}"
  mkdir -p "${pkgdir}/opt"
  cp -a "${srcdir}/pogo-optimizer-${pkgver}" "${pkgdir}/opt/${pkgname}"
}
