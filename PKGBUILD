pkgname=baml-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="BAML wrapper - toolchain manager and launcher (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.1/baml-wrapper-no-self-update-0.2.1-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.1/baml-wrapper-no-self-update-0.2.1-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5458ea549d9087b4ed4f2c4c64eece41f8919544a7d6f18f88ba8df3940e3bd6')
sha256sums_aarch64=('5b7706008c6fcc80d6770716e0a9a4b666af7fcd91b0c142bf90bb36cc555513')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
