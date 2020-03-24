# Maintainer: KnockKnockP <memeboi420666 at gmail dot com>
#                         (What a silly email, I regret making it like this.).

pkgname="stretchy-snek-boi"
pkgver=1.0.5
pkgrel=1
pkgdesc="A snake game clone."
arch=("x86_64")
license=('WTFPL 2.0')
url="https://www.github.com/KnockKnockP/stretchy-snek-boi/"
source=("https://github.com/KnockKnockP/stretchy-snek-boi/archive/$pkgver.tar.gz")
md5sums=(SKIP)

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}