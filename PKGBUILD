# Maintainer: Malachi Soord <me@malachisoord.com>

pkgname=ktunnel-bin
pkgver=1.4.7
pkgrel=1
pkgdesc="A CLI that exposes your local resources to kubernetes."
arch=('x86_64')
url="https://github.com/omrikiei/ktunnel"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omrikiei/ktunnel/releases/download/v${pkgver}/ktunnel_${pkgver}_Linux_x86_64.tar.gz")
sha512sums=('bb26a1039b2f1e3bbfc6aae873afd4ed49faa110d36d25e4cb5a7187d9ea84376d27189d08d9bbb545d695bd84879648aaa08921805ee6df2f958d8e050b6ec1')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 ktunnel "$pkgdir/usr/bin/ktunnel"
}
