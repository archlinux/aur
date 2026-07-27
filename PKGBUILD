pkgname=baml-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.2/baml-wrapper-no-self-update-0.2.2-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.2/baml-wrapper-no-self-update-0.2.2-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b7e914a828530fe6febf5d01846c525f8c13e7d56152e6f92505bdccf2d69d0c')
sha256sums_aarch64=('12be7587a8ee85c1a91070f2b6f5d7f20bee4de040e4f4d0b1eed15c766e27bc')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
