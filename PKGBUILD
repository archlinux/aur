# Maintainer: aurrrrrr <no email>

pkgname=ttf-loveletter
pkgver=1
pkgrel=1
pkgdesc='LoveLetter Typewriter, a free-ware font that had been used in "lain"'
arch=(any)
url="http://www.konaka.com/alice6/lain/resources.html"
license=('unknown')
source=("http://www.konaka.com/alice6/lain/img/LoveLetter.zip")
b2sums=('20680dd2fbad90c769688d3b3a87d2ddba3beda8c59c3114998e0b8d21a95519fc44cf6bc4339af817ffda1cfddf0d2b1fc6c0819571a74a1fed94c3f194f99e')

package() {
	cd "$srcdir"
	install -Dm644 LoveLetter.TTF "$pkgdir/usr/share/fonts/TTF/loveletter.ttf"
}

