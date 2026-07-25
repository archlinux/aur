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
sha256sums_x86_64=('e685ed16ad1892c8644f7dcc1db95a5acbf6634af3b5ceead4b18fd31c1f6221')
sha256sums_aarch64=('3ad261992a37fed1a9d0f9abe9dd020a3ef4e82e64ba9df5728a8a20dfcb5c72')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
