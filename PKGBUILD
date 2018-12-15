# Maintainer: Erazem Kokot <contact at erazem dot eu>

pkgname='hblock'
pkgver=2.0.0
pkgrel=1
pkgdesc='An adblocker that creates a hosts file from automatically downloaded blacklists'
arch=('any')
url='https://github.com/hectorm/hblock'
license=('MIT')
sha256sums=('fc2d59f38d3db4c1d39def1f2360299472ae209fb1d60b28121d8727d38bf7a8')
source=("https://raw.githubusercontent.com/hectorm/${pkgname}/v${pkgver}/${pkgname}")

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
}
