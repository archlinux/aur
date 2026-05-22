pkgname=baml-bin
pkgver=0.11.0.alpha.4157
pkgrel=1
pkgdesc="BAML - the language for agents (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4157/baml-language-0.11.0-alpha.4157-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4157/baml-language-0.11.0-alpha.4157-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c1ca88122abb5a355994fe194ea881141ce0f77981b0bdacdfc7c5d9e1d47935')
sha256sums_aarch64=('837ac7f42dbf224a1d481e3b562d63af60b6cfa6b4c5069178835a65279414ee')

package() {
    install -Dm755 baml-cli "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
