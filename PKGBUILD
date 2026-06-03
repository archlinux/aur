pkgname=baml-bin
pkgver=0.11.0.alpha.4753
pkgrel=1
pkgdesc="BAML - the language for agents (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4753/baml-language-0.11.0-alpha.4753-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4753/baml-language-0.11.0-alpha.4753-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('bbe52ee5c883f052f77edb53a79cc89061f937168b870f68cd98fb99e93198ad')
sha256sums_aarch64=('270178f9a3d75a6157d1221cde887027c9d4e9dba374698705bf9f56a13a5923')

package() {
    install -Dm755 baml-cli "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
