pkgname=baml-bin
pkgver=0.11.0.alpha.4734
pkgrel=1
pkgdesc="BAML - the language for agents (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4734/baml-language-0.11.0-alpha.4734-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4734/baml-language-0.11.0-alpha.4734-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('1a28bf03b16152379f693e2fd0cb64ca5581c5258f63f306328c95d1250e6e80')
sha256sums_aarch64=('590967a05096903220d8d3964c6c651ce2dd667b107eac9063041c867c69a55f')

package() {
    install -Dm755 baml-cli "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
