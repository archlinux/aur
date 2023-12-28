# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=(otf-haskoy ttf-haskoy woff2-haskoy ttf-haskoy-variable woff2-haskoy-variable)
_reponame=haskoy
pkgbase=haskoy-font
pkgver=2.0.0
pkgrel=1
pkgdesc='Open-source variable sans-serif typeface family'
arch=(any)
url="https://github.com/ertekinno/$_reponame"
license=(OFL)
source=("git+https://github.com/ertekinno/$_reponame")
sha256sums=('SKIP')

package_otf-haskoy() {
	pkgdesc+=' (16 static cuts)'
	cd "${_reponame}"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/haskoy" fonts/otf/*.otf
}

package_ttf-haskoy() {
	pkgdesc+=' (16 static cuts)'
	cd "${_reponame}"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/haskoy" fonts/ttf/*.ttf
}

package_woff2-haskoy() {
	pkgdesc+=' (16 static cuts)'
	cd "${_reponame}"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/haskoy" fonts/webfonts/*.woff2
}

package_ttf-haskoy-variable() {
	pkgdesc+=' (variable version)'
	cd "${_reponame}"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/haskoy" fonts/variable/*.ttf
}

package_woff2-haskoy-variable() {
	pkgdesc+=' (variable version)'
	cd "${_reponame}"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/haskoy" fonts/variable/*.woff2
}

# vim:set ts=2 sw=2 et:
