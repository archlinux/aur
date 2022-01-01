# Maintainer: mochaaP <aur@mochaa.ws>

pkgname=keychron-udev
pkgver=1.0.0
pkgrel=1
pkgdesc="udev rules for keychron keyboards"
arch=('any')
url="https://github.com/kurgol/keychron"
license=('ISC')
source=('80-keychron.rules')
sha256sums=('994fdeae38cbc30ca946dcb3ddb71ebfeb1f27c2238fd5165e9281d2704be429')

package() {
  install -Dm644 80-keychron.rules "${pkgdir}/usr/lib/udev/rules.d/80-keychron.rules"
}
