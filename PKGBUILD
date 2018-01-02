# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
_RELEASES_URL="https://github.com/tomnomnom/gron/releases/download"
pkgname=gron-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="gron transforms JSON into discrete assignments to make it easier to grep."
arch=('i686' 'x86_64')
url="https://github.com/tomnomnom/gron"
license=('MIT')
depends=('glibc')
groups=()
source_i686=("$_RELEASES_URL/v$pkgver/gron-linux-386-$pkgver.tgz")
source_x86_64=("$_RELEASES_URL/v$pkgver/gron-linux-amd64-$pkgver.tgz")
sha256sums_i686=('d44e052e83b2fbcf7197a38f0b7114b49a591fd5d5ba5d558b818cb2bba172c0')
sha256sums_x86_64=('f874724398de74f14f047366c3e2cb1be690dbd2000b22b1b1f515d78fce3982')

package() {
    install -D "$srcdir/gron" "$pkgdir/usr/bin/gron"
}
