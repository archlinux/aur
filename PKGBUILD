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
sha256sums_x86_64=('8b17f31c55c67779d361b342d0b4ac53efb4ebe039a919cb3877072237d27206')
sha256sums_aarch64=('a12a36c82b777a30d0b30ba57c5689f5e6fbba32e5fcab42435a5d93ea10e7ff')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
