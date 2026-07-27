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
sha256sums_x86_64=('adb6a88ae769a2d29da1464ef2ab3e1df4a1810f326900fbc1cad4c2910e32f9')
sha256sums_aarch64=('96b7fec946c0bc72534059076ff893b5dba60fbf4d4f14a3c813f96c36aa8796')

package() {
    install -Dm755 bin/baml "$pkgdir/usr/bin/baml"
}
