# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>

_RELEASES_URL="https://github.com/tomnomnom/gron/releases/download"

pkgname=gron-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="gron transforms JSON into discrete assignments to make it easier to grep."
arch=('i686' 'x86_64')
url="https://github.com/tomnomnom/gron"
license=('MIT')
depends=('glibc')
groups=()
source_i686=("$_RELEASES_URL/v$pkgver/gron-linux-386-$pkgver.tgz")
source_x86_64=("$_RELEASES_URL/v$pkgver/gron-linux-amd64-$pkgver.tgz")
sha256sums_i686=('0fbe0cea479390d05a6c29afe78d670e664f2d0fee95ac958e8037c149d4023f')
sha256sums_x86_64=('58ac5eb41ef6246e85d8464f66b54238e40162d2fce9e4836eea882257639070')

package() {
    install -D "$srcdir/gron" "$pkgdir/usr/bin/gron"
}
