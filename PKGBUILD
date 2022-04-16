# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=simple-tls-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A simple TLS1.3 tunnel for TCP traffic."
arch=('x86_64')
url="https://github.com/IrineSistiana/simple-tls"
license=('GPL3')
provides=('simple-tls')
conflicts=('simple-tls')
source=("${url}/releases/download/v${pkgver}/simple-tls-linux-amd64.zip")
sha256sums=('a4d2d9edb253f4e71c9ccbf9fa6d8fb5e9ac668c2bb53b720123a436308f0449')

package() {
  cd "$srcdir"
  install -Dm755 simple-tls "${pkgdir}/usr/bin/simple-tls"
}
