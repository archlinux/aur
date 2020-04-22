# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=depcharge-bin
pkgver=60a39da
pkgrel=1
pkgdesc="A tool designed to help orchestrate the execution of commands across many directories at once"
arch=('x86_64')
url='https://github.com/centerorbit/depcharge'
license=('MIT')
provides=("${pkgname%-bin}")
makedepends=('go-pie')
source=("${url}/releases/download/${pkgver}/depcharge-linux-x64.zip")
sha256sums=('d6742b2c0152a83d85c7e5505aaa4ebfbdb1708fc5bc8f14ec06de315959375a')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin/"
}