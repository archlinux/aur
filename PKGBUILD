# Maintainer: Your Name <bongopoyo@proton.me>
pkgname=ring
pkgver=0.0.1
pkgrel=1
pkgdesc="Ping-like utility written in Rust"
arch=('x86_64')
url="https://github.com/MHashirShahzad/ring"
license=('GPL')
depends=('glibc')
source=("https://github.com/mhashirshahzad/ring/releases/download/v$pkgver/ring.tar.gz")
sha256sums=('208af812b770fe1fcd42be129df09e19c7dfee2e018659cbb0bc013ce150b229')

package() {
    mkdir -p "$pkgdir/usr/bin"

    install -Dm755 "$srcdir/ring" "$pkgdir/usr/bin/ring"

}
