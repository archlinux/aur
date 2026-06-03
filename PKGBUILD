pkgname=baml-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ee4c3feacacd1f9426037109fd3aa1b4bbf5842fba624c82eb892329c8c2af87')
sha256sums_aarch64=('892dd26d0e2539d93b7190a06747df5191e4f5c50c83d24e99ffbe91307f3c61')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
