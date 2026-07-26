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
sha256sums_x86_64=('211ae7f20dd6f2834e587fdf11922730ab431ce13c50512aa89f0f25f2bb2cd5')
sha256sums_aarch64=('7b7d374cad456dd11eef937a86024a1575533425592685f234653fda50f94c61')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
