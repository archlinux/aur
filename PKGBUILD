# Maintainer: KnockKnockP <memeboi420666 at gmail dot com>
#                         (What a silly email, I regret making it like this.).

pkgname="stretchy-snek-boi-git"
pkgver=1.0.6
pkgrel=1
pkgdesc="A snake game clone."
arch=("x86_64")
license=('WTFPL 2.0')
url="https://www.github.com/KnockKnockP/stretchy-snek-boi/"
source=("stretchy-snek-boi::git+https://github.com/KnockKnockP/stretchy-snek-boi.git")
md5sums=(SKIP)

build() {
	cd "$pkgname"
	make stretchy-snek-boi-git
}

package() {
	cd "$pkgname"
	mkdir $pkgdir/usr/bin/ -p
	make DESTDIR="$pkgdir/usr/bin" install-git
}