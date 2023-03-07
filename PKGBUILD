# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=ktunnel-bin
pkgver=1.4.8
pkgrel=1
pkgdesc="A CLI that exposes your local resources to kubernetes."
arch=('x86_64')
url="https://github.com/omrikiei/ktunnel"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omrikiei/ktunnel/releases/download/v${pkgver}/ktunnel_${pkgver}_Linux_x86_64.tar.gz")
sha512sums=('d73960f29ba9e262f4398a92877ab1cbd5b3f98f983dfb235300afd828274a3bfda60e1a552b0273620f9f725a39b1b70eaeeae552a966e46d3184310f149259')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 ktunnel "$pkgdir/usr/bin/ktunnel"
}
