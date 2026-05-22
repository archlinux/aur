pkgname=baml-bin
pkgver=0.11.0.alpha.4116
pkgrel=1
pkgdesc="BAML - the language for agents (prebuilt binary)"
arch=('x86_64')
url="https://github.com/BoundaryML/baml"
license=('Apache-2.0')
provides=('baml')
conflicts=('baml')

source_x86_64=("https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4116/baml-language-0.11.0-alpha.4116-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('35691dfa9c94820f60b2979f2351bea3d7ac6eb00f7ec301c77b1125ee508ad7')

package() {
    install -Dm755 baml-cli "$pkgdir/usr/bin/baml-cli"
    ln -s baml-cli "$pkgdir/usr/bin/baml"
}
