pkgname=baml-bin
pkgver=0.11.0.alpha.4726
pkgrel=1
pkgdesc="BAML - the language for agents (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4726/baml-language-0.11.0-alpha.4726-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4726/baml-language-0.11.0-alpha.4726-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('21a3eddc8915b1a426a96bb9efa4f2f3aa3e7d5fbb40ad114e27c2bc3101576f')
sha256sums_aarch64=('49ce0110b4891702d77b4d71ec023021261662555b7ec1e0c5252976b798c49a')

package() {
    install -Dm755 baml-cli "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
