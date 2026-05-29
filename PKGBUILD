pkgname=baml-bin
pkgver=0.11.0.alpha.4383
pkgrel=1
pkgdesc="BAML - the language for agents (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4383/baml-language-0.11.0-alpha.4383-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4383/baml-language-0.11.0-alpha.4383-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c404ab99789178232a0f8cbed749572744eced8e6c6c75377755a5ea4a5326f8')
sha256sums_aarch64=('7d002632937efd358e500ba3bfa15bc61e6583ff30c00120592e031e5f2ec836')

package() {
    install -Dm755 baml-cli "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
