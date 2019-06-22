# Maintainer: hcra <hcra at u53r dot space>

pkgname=netrw-bin
_pkgname=netrw
pkgver=1.3.2
pkgrel=3
pkgdesc="Simple tool for transporting data without a server."
arch=('x86_64' 'i686')
url="https://mamuti.net/netrw"
license=('GPL3')
source=(https://mamuti.net/files/$_pkgname/x86/$_pkgname-x86-$pkgver.tar.bz2)
sha1sums=('5037207bac70588b108e99c90628d649276dcf86')

package() {
	cd "${srcdir##-bin}/$_pkgname-x86-$pkgver"

	install -Dm755 "netread" "$pkgdir/usr/bin/netread"
	install -Dm755 "netwrite" "$pkgdir/usr/bin/netwrite"
	install -Dm755 "nr" "$pkgdir/usr/bin/nr"
	install -Dm755 "nw" "$pkgdir/usr/bin/nw"

	install -Dm644 "AUTHORS" "$pkgdir/usr/share/doc/$_pkgname/AUTHORS"
	install -Dm644 "COPYING" "$pkgdir/usr/share/doc/$_pkgname/COPYING"
	install -Dm644 "NEWS" "$pkgdir/usr/share/doc/$_pkgname/NEWS"
	install -Dm644 "README" "$pkgdir/usr/share/doc/$_pkgname/README"
	install -Dm644 "THANKS" "$pkgdir/usr/share/doc/$_pkgname/THANKS"
}
