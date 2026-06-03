pkgname=baml-bin
pkgver=0.11.0.alpha.4780
pkgrel=1
pkgdesc="BAML - the language for agents (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4780/baml-language-0.11.0-alpha.4780-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4780/baml-language-0.11.0-alpha.4780-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('04255efbdbe1777ea1c2169fc8a8b62c394c4203a2970914a0d958dfa5a6bdb2')
sha256sums_aarch64=('38d6ba14bd8d963b12dc20f6a9164fceef729e438acbaa8c056313c39bccb4bd')

package() {
    install -Dm755 baml-cli "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
