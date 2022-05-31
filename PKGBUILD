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
sha512sums=('cdfa018e3ec4db157e259dfc58c00358ea6dea6c714715bbaaaced7f2348e44e03159f636fc641eae03fc02fce207841f9705b8b21a6ec2f9a907442097f019e')

package() {
  cd "$srcdir"
  install -Dm755 simple-tls "${pkgdir}/usr/bin/simple-tls"
}
