# Maintainer: 5t4l1n <nexulean@nexulean.info>
pkgname=nextor-ip-changer
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python-based tool to change Tor IPs dynamically"
arch=('any')
url="https://github.com/Stalin-143/NexTOR_IP_CHANGER"
license=('MIT')
depends=('python' 'tor')
makedepends=('git')
source=("$pkgname::git+$url#tag=v$pkgver")
md5sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 NexTOR.py "$pkgdir/usr/bin/nextor"
}
