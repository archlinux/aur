pkgname=baml-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.0/baml-wrapper-0.2.0-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.0/baml-wrapper-0.2.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4e21a6166cbe4fa7fa165451b9427fc3498b66491a063819628c20438bf41dcd')
sha256sums_aarch64=('f164bc01ec011d7bd60301b2d6d295a51176058aaf2494f64e46403811aaf7aa')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
