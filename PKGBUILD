# Maintainer: Allan Niles <allancoding.dev@gmail.com>
pkgname=kill-net
pkgver=1.2
pkgrel=1
pkgdesc="A script to overwhelm/flood the connected network with traffic using zmap basically it kills it."
arch=('any')
url="https://github.com/allancoding/kill-net"
license=('Apache-2.0')
depends=('zmap')
source=("git+https://github.com/allancoding/kill-net.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
    cd "$srcdir/kill-net"
    mv kill-net.sh kill-net
    install -Dm755 kill-net "$pkgdir/usr/bin/kill-net"
}
