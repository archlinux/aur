pkgname=baml-bin
pkgver=0.11.0.alpha.4776
pkgrel=1
pkgdesc="BAML - the language for agents (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4776/baml-language-0.11.0-alpha.4776-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4776/baml-language-0.11.0-alpha.4776-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('fb3a6aecc75ee0fa5a4fec54c7f8962436abd57c171f05dd1cfbae2a6694ae93')
sha256sums_aarch64=('f40967abebc614c34aa3e6e717a18044aace8c6ac90dc0ae905aec41d45fa50c')

package() {
    install -Dm755 baml-cli "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
