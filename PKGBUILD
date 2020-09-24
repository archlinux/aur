# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=(otf-commissioner ttf-commissioner ttf-commissioner-variable)
_reponame=Commissioner
pkgbase=commissioner-font
pkgver=1.000
_commit=d76954316c5802e590e42acad3eebc8df84c49d8
pkgrel=5
pkgdesc='Sans typeface by Kostas Bartsokas'
arch=(any)
url="https://github.com/kosbarts/$_reponame"
license=(OFL)
source=("$url/archive/$_commit/$pkgbase-$pkgver-$pkgrel.zip")
sha512sums=('182fa3aadf086c37187511f3acb4d59610884dd53d8ff8bf0eb6c473b3e5570dc15b3fa288db14288714b2efdcee9549c20331252950a295b321d7a21cfeb9c6')

package_otf-commissioner() {
	pkgdesc+=' (54 static cuts)'
	cd "$_reponame-$_commit"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/commissioner" fonts/static/otfs/*.otf
}

package_ttf-commissioner() {
	pkgdesc+=' (54 static cuts)'
	cd "$_reponame-$_commit"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/commissioner" fonts/static/ttfs/*.ttf
}

package_ttf-commissioner-variable() {
	pkgdesc+=' (variable version)'
	cd "$_reponame-$_commit"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/commissioner" fonts/variable/*.ttf
}
