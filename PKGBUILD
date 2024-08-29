# Maintainer: neolouker <neolouker@gmail.com>
# Contributor: Francisco Giordano <fg@frang.io>

pkgname=volta-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="JS Toolchains as Code"
arch=('x86_64')
url="https://volta.sh/"
license=('BSD-2-Clause')

source=("$pkgname-$pkgver.tar.gz::https://github.com/volta-cli/volta/releases/download/v$pkgver/volta-$pkgver-linux.tar.gz"
        "https://raw.githubusercontent.com/volta-cli/volta/v$pkgver/LICENSE")
b2sums=('e5fc2323311c3d2f2811df43d1e1910db4ad901cc39092b4817bb8e7d28f002dbeb2f172482648160d3f6db0b2af76865f6baedd082ab39c67a0d9486d257912'
        'c76c693cbeb154a7613f248c4b091c3d2713afc784166e446889e6ada4f4ac304706e04a97aed80003750f7118612881b1f7fc64ac0459c9310083cccb878865')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" volta volta-shim volta-migrate
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
}
