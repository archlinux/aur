# Maintainer: Heptazhou <heptazhou at icloud dot com>

pkgname=conda-zsh-completion
pkgver_=382d840f7ad053b3b2ccf0b1f52b26bdabaf66b3
pkgver=0.10
pkgrel=2
pkgdesc="Zsh completion for conda and mamba"
arch=("any")
url="https://github.com/esc/$pkgname"
license=("custom")
depends=("zsh" "python")
source=("$pkgname-v$pkgver.tar.gz::https://github.com/esc/$pkgname/archive/$pkgver_.tar.gz")
sha256sums=("74f7651706e470443192966d5fba8f89a0a7145add625a58eb7bf90987521fa6")
pkgdir_="usr/share/zsh/site-functions"

package() {
	cd -- "$srcdir/$pkgname-$pkgver_"
	install -Dm644 -t "$pkgdir/$pkgdir_" "_conda"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}

build() {
	cd -- "$srcdir/$pkgname-$pkgver_"
	mv -f "LICENSE.txt" "LICENSE"
}
