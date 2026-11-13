pkgname=baml-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
# Stripping rewrites the executable and destroys the packed BAML payload.
options=('!strip')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.4.0/baml-wrapper-no-self-update-0.4.0-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.4.0/baml-wrapper-no-self-update-0.4.0-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ad19f8dea0edfa35dfe7ffd522a91815caa6c872f7e8a72afc5ed9d1c153353e')
sha256sums_aarch64=('3a66650a9f8e6ed31ae17b018448094c9d25c5b31f3ffb915a1f7afeee838173')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
