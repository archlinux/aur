pkgname=baml-bin
pkgver=0.11.0.alpha.4738
pkgrel=1
pkgdesc="BAML - the language for agents (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4738/baml-language-0.11.0-alpha.4738-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4738/baml-language-0.11.0-alpha.4738-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7a10c45aad02c3c5b778c34ee11431766f5a3639d22fc7e572679fed21fb8c92')
sha256sums_aarch64=('be7eeaefc73ca870057a6d4b71b4bd54a288f569fcaa021d9d8efbcde4220271')

package() {
    install -Dm755 baml-cli "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
