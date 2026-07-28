pkgname=baml-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.3/baml-wrapper-no-self-update-0.2.3-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.3/baml-wrapper-no-self-update-0.2.3-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f9837e05f7e4778776bca1e7ce776351706a66d41e012bd1e948f6e9666d1c98')
sha256sums_aarch64=('4dc3e37be9301270745fdd1eee46d62f44fc939cc4d8546296df612efc602647')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
