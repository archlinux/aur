# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=ktunnel-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="A CLI that exposes your local resources to kubernetes."
arch=('x86_64')
url="https://github.com/omrikiei/ktunnel"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omrikiei/ktunnel/releases/download/v${pkgver}/ktunnel_${pkgver}_Linux_x86_64.tar.gz")
sha512sums=('f01e612468eb295e6cefc76f903fb229e26f3044922f569a14235f51f66e122f672c10ff8eb5f0d22d599e7ea6e0fbbc7d469d5968e96177367c92c6caa6ea76')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 ktunnel "$pkgdir/usr/bin/ktunnel"
}
