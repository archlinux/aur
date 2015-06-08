# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='makechapterlist'
pkgver=1.0.1
pkgrel=1
pkgdesc='Trivial script used to make a chapter list file that MP4Box can use when writing m4b audiobooks.'
arch=('any')
url=https://github.com/graysky2/makechapterlist
license=('GPL')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('0540cd18f4f4dcec180697b041a400b7387c0550740948c8c7770d6a7c9f3486')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
