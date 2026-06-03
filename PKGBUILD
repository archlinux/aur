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
sha256sums_x86_64=('506c0f531ad5d220a503f9135f104b50746d6dd14c6e9419859da94ebb58f14c')
sha256sums_aarch64=('cb0166b896cd2ff8b9349cc29fbeb89140a909a96c020dabb8b410615013c29e')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
