pkgname=baml-bin
pkgver=0.11.0.alpha.4768
pkgrel=1
pkgdesc="BAML - the language for agents (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4768/baml-language-0.11.0-alpha.4768-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4768/baml-language-0.11.0-alpha.4768-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b83e31e6799bf4ee5a85d4f16e8e38231e51853be3f923ad93346b0ec659d690')
sha256sums_aarch64=('522831f6bcc86d10f82c02004f96e6d07fedce48d3d5cd106824e5bf5f44a37d')

package() {
    install -Dm755 baml-cli "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
