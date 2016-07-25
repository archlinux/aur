# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=pogo-optimizer
pkgver=1.2.1
pkgrel=1
pkgdesc='MITM data analysis utility for Pokemon GO'
arch=('any')
url='https://github.com/justinleewells/pogo-optimizer'
license=('GNU GPLv3+')
depends=(nodejs protobuf npm)
source=("https://github.com/justinleewells/pogo-optimizer/archive/v${pkgver}.tar.gz")
md5sums=('773a4a7499a2e38dfd9e1a9cfc1be945')

package() {
  cd "${srcdir}/pogo-optimizer-${pkgver}"
  mkdir -p "${pkgdir}/opt"
  cp -a "${srcdir}/pogo-optimizer-${pkgver}" "${pkgdir}/opt/${pkgname}"
}
