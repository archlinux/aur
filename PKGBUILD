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
sha256sums_x86_64=('1ee7b85e09e8f533fdeb2e94ffbe1e77f7d59584fcef44c7112a6e8708fd8dbc')
sha256sums_aarch64=('6ed6770b0a50a655a383a5885d9a31591f1aef9cffb44e73957fe588e5d080d3')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
