# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ttf-workplace-sans
pkgdesc='Semi-condensed sans font for user interfaces inspired by the OS/2 Warp system font'
pkgver=1.04
pkgrel=1
url=http://www.altsan.org/creative/fonts/workplace
arch=(any)
license=(custom:OFL)
source=("$url/wpsu_ttf_${pkgver//./}.zip")
b2sums=('0b7d560f87e0ed0a32cb2ad4b64bf09f12fb41f55658abeff9817ae6bc9bf3cb62e2ab23d9531b4937abf66508a91474368bc96250fcbac179b27653d9d2aa91')

package () {
	install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" wpsu{,b}.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" wpsu.txt
}
