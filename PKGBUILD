# Maintainer: Joakim Hulthe <joakim@hulthe.net>
# Maintainer: Vidar Magnusson <git@vidarmagnusson.com>

pkgname=printit-bin
pkgver=1.0.1
pkgrel=2
pkgdesc="CLI for printing at Chalmers University"
url="https://github.com/hulthe/printit"
license=("MPL2")
arch=("x86_64")
provides=("printit-git")
conflicts=("printit-git")
source=("https://github.com/hulthe/printit/releases/download/$pkgver/printit-$pkgver-x86_64.tar.gz")
sha256sums=("bbc52fe710558e5c2ea84bb9498952a13c7ae96a74544c06a393e826f6b5d383")

package() {
    install -Dm755 printit -t "$pkgdir/usr/bin"
}
