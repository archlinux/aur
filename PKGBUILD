# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tuhana GAYRETLİ <tuhana at tuta dot io>
# shellcheck disable=SC2034,SC2148,SC2164,SC2154,SC2128

pkgbase=jura-font
pkgname=(ttf-jura otf-jura ttf-jura-variable)
pkgver=r108.f9df75d
_commit=f9df75d92c93324e74e5ec0df6d91c8ee4b84b5a
pkgrel=2
pkgdesc="Jura font"
arch=('any')
url=https://github.com/ossobuffo/jura
license=('OFL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('60ec536e7eadb9d1c86e6bc488c3364a3d63b39134fee15b9b987699ecf77b90')

package_ttf-jura() {
	pkgdesc+=" - TTF variation"

	cd "jura-$_commit"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt COPYRIGHT.md
	install -Dm644 -t "$pkgdir/usr/share/fonts/jura" fonts/ttf/*.ttf
}

package_otf-jura() {
	pkgdesc+=" - OTF variation"

	cd "jura-$_commit"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt COPYRIGHT.md
	install -Dm644 -t "$pkgdir/usr/share/fonts/jura" fonts/otf/*.otf

}

package_ttf-jura-variable() {
	pkgdesc+=" - variable variation"

	cd "jura-$_commit"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt COPYRIGHT.md
	install -Dm644 -t "$pkgdir/usr/share/fonts/jura" fonts/variable/*.ttf
}
