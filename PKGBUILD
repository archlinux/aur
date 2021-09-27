# Maintainer: Joakim Hulthe <joakim@hulthe.net>
# Maintainer: Vidar Magnusson <git@vidarmagnusson.com>

pkgname=printit-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI for printing at Chalmers University"
url="https://github.com/hulthe/printit"
license=("MPL2")
arch=("x86_64")
provides=("printit")
conflicts=("printit")
source=("https://github.com/hulthe/printit/releases/download/$pkgver/printit-$pkgver-x86_64.tar.gz")
sha256sums=("2040afcd7da008495b21f05fe82b4f415ba861f149f02021bbee9f7c30beeaa0")

package() {
    install -Dm755 printit -t "$pkgdir/usr/bin"
}
