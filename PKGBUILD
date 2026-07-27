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
sha256sums_x86_64=('2c8a5daebcbcf724fb6aec62c42c981c88401653b64d9aedb7856d81f6a83bfd')
sha256sums_aarch64=('a83454c00b5a8f34b0c9f3eaaf6bc5ef47a64223dc84343f9e398cea03c4b49d')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
