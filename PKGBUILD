pkgname=baml-bin
pkgver=0.11.0.alpha.4723
pkgrel=1
pkgdesc="BAML - the language for agents (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4723/baml-language-0.11.0-alpha.4723-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4723/baml-language-0.11.0-alpha.4723-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4e8a1e0aa0cf8a9c848d2e7dd3dc774b678f8fdcea6c2aba663f9af118a3e47f')
sha256sums_aarch64=('967794f8dbdf022c201633a2fb706539b86fb1b0ca53c62aaa433843f1be40c7')

package() {
    install -Dm755 baml-cli "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
