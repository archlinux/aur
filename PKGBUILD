# Maintainer: neolouker <neolouker@gmail.com>
# Contributor: Francisco Giordano <fg@frang.io>

pkgname=volta-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="JS Toolchains as Code"
arch=('x86_64')
url="https://volta.sh/"
license=('BSD-2-Clause')

source=("$pkgname-$pkgver.tar.gz::https://github.com/volta-cli/volta/releases/download/v$pkgver/volta-$pkgver-linux.tar.gz"
        "https://raw.githubusercontent.com/volta-cli/volta/v$pkgver/LICENSE")
b2sums=('75096d9f3becdaf03317b76aaafcbe6b4d5ea00beb7b80728a6db5b91ee154b4635b485f8477473b146add35228369849a07d1a6d2b3fd06f8a3a1aa0c7edffd'
        'c76c693cbeb154a7613f248c4b091c3d2713afc784166e446889e6ada4f4ac304706e04a97aed80003750f7118612881b1f7fc64ac0459c9310083cccb878865')

package() {
  install -Dm755 -t "$pkgdir/usr/bin" volta volta-shim volta-migrate
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
}
