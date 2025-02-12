# Maintainer: neolouker <neolouker@gmail.com>
# Contributor: Francisco Giordano <fg@frang.io>

pkgname=volta-bin
pkgver=2.0.2
pkgrel=2
pkgdesc="JS Toolchains as Code"
arch=('x86_64' 'aarch64')
url="https://volta.sh/"
license=('BSD-2-Clause')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/volta-cli/volta/releases/download/v$pkgver/volta-$pkgver-linux.tar.gz"
               "https://raw.githubusercontent.com/volta-cli/volta/v$pkgver/LICENSE")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/volta-cli/volta/releases/download/v$pkgver/volta-$pkgver-linux-arm.tar.gz"
                "https://raw.githubusercontent.com/volta-cli/volta/v$pkgver/LICENSE")

package() {
  install -Dm755 -t "$pkgdir/usr/bin" volta volta-shim volta-migrate
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
}

b2sums_x86_64=('75096d9f3becdaf03317b76aaafcbe6b4d5ea00beb7b80728a6db5b91ee154b4635b485f8477473b146add35228369849a07d1a6d2b3fd06f8a3a1aa0c7edffd'
               'c76c693cbeb154a7613f248c4b091c3d2713afc784166e446889e6ada4f4ac304706e04a97aed80003750f7118612881b1f7fc64ac0459c9310083cccb878865')
b2sums_aarch64=('3633744e6d914fa2b6aa4c683aa9b44e4f585b5a815a2df4ae42665c879a4bc2651113ef5f8e077a3b9203a6ddfd876a6de900cc7aeb32321d48775e6738ddba'
                'c76c693cbeb154a7613f248c4b091c3d2713afc784166e446889e6ada4f4ac304706e04a97aed80003750f7118612881b1f7fc64ac0459c9310083cccb878865')
