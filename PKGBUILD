# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=ttf-workplace-gothic
pkgdesc='Semi-condensed sans font for user interfaces inspired by the OS/2 Warp system font'
pkgver=0.3
pkgrel=1
url=http://www.altsan.org/creative/fonts/workplace
arch=(any)
license=(custom:OFL)
source=("$url/wpgoth_ttf_${pkgver//./}.zip")
b2sums=('e78a6190bb0010008680706e0db70f2cbddc90ed413ba2fa91d248c1b5d6306c3054058cf354498ecd352c54e898677ecffb96e45e94baa027afbc6e2dbe05d4')

package () {
	install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" wpgoth{,b}.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" wpgoth.txt
}
