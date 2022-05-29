# Maintainer: 0xsapphir3 <0xsapphir3@gmail.com>

pkgname=gitcolorscripts
pkgver=1.0.0
pkgrel=1
pkgdesc="Get your github contribution graph in your terminal"
arch=('any')
url="https://github.com/BladeOfLightX/gitcolorscripts"
license=('MIT')
makedepends=('cargo')
source=("git+$url")
sha512sums=('SKIP')

package() {
	cd "$pkgname"

	install -Dm755 "bin/gitcolorscripts" "$pkgdir/usr/bin/gitcolorscripts"

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "gitcolorscripts.service" "$pkgdir/usr/lib/systemd/system/gitcolorscripts.service"
}
