# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=air-bin
pkgver=1.12.4
pkgrel=1
pkgdesc="Cloud Live reload for Go apps"
arch=('x86_64')
provides=("${pkgname%-bin}")
url='https://github.com/cosmtrek/air'
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cosmtrek/air/releases/download/v1.12.4/air_1.12.4_linux_amd64.tar.gz")
sha256sums=('d1078851009cc34a4c1d47be10e34b7fb853e639e5785fc120622addc6c93de0')

package() {
  install -Dm755 air "${pkgdir}/usr/bin/air"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
