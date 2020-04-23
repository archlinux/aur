# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=usql-bin
pkgver=0.7.8
pkgrel=1
pkgdesc="Universal command-line interface for SQL databases"
arch=('x86_64')
url='https://github.com/xo/usql'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${url}/releases/download/v${pkgver}/usql-${pkgver}-linux-amd64.tar.bz2")
sha256sums=('406538408da22a01eb56644447bb781c509dd634c7f89d5f428df22289243946')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
}