# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
_RELEASES_URL="https://github.com/tomnomnom/gron/releases/download"
pkgname=gron-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="gron transforms JSON into discrete assignments to make it easier to grep."
arch=('i686' 'x86_64')
url="https://github.com/tomnomnom/gron"
license=('MIT')
depends=('glibc')
groups=()
source_i686=("$_RELEASES_URL/v$pkgver/gron-linux-386-$pkgver.tgz")
source_x86_64=("$_RELEASES_URL/v$pkgver/gron-linux-amd64-$pkgver.tgz")
sha256sums_i686=('e84afa5cfda999d46d5b68b5ff4b123d740104226d6c850a624fec999fa898db')
sha256sums_x86_64=('891470b44d7faef49683dd11b11a1f296324118e869a76e3fae61cf6b35c6b74')

package() {
    install -D "$srcdir/gron" "$pkgdir/usr/bin/gron"
}
