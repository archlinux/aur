pkgname=baml-bin
pkgver=0.11.0.alpha.4335
pkgrel=1
pkgdesc="BAML - the language for agents (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4335/baml-language-0.11.0-alpha.4335-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4335/baml-language-0.11.0-alpha.4335-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('54a836776daadd8ec7fc097ce121dd2ccbd5d3807903055723c21fd745bdca1a')
sha256sums_aarch64=('f16c3b9b9580a619ddcb5790a7f30447fb30a081e5906a3580d65ae6537f1b7e')

package() {
    install -Dm755 baml-cli "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
