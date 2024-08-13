# Maintainer: neolouker <neolouker@gmail.com>
# Contributor: Francisco Giordano <fg@frang.io>

pkgname=volta-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="JS Toolchains as Code"
arch=('x86_64')
url="https://volta.sh/"
license=('BSD-2-Clause')

source=("$pkgname-$pkgver.tar.gz::https://github.com/volta-cli/volta/releases/download/v$pkgver/volta-$pkgver-linux.tar.gz"
        "https://raw.githubusercontent.com/volta-cli/volta/v$pkgver/LICENSE")
b2sums=('cb0f3f91462e2d2e4906e5bbdecd2d7697325959413600f65a07e6ef85267f0cec6814679a3bbb5ce404a871e7351066c3c1f61f9e2898b81110e1ff3ef56db8'
        'c76c693cbeb154a7613f248c4b091c3d2713afc784166e446889e6ada4f4ac304706e04a97aed80003750f7118612881b1f7fc64ac0459c9310083cccb878865')

package() {
  install -Dm644 -t "$pkgdir/usr/bin" volta volta-shim volta-migrate
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
}
