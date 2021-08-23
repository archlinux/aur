# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=fonts-c-fonts-git
pkgname=(
	ttf-ceva-c2-git
	otf-ceva-c2-git
	ttf-ceva-cm-git
	ttf-linek-git
	ttf-x-scale-git
)
pkgver=r3.3de073b
pkgrel=1
pkgdesc="c-base fonts"
arch=('any')
url="https://github.com/c-base/c-fonts"
license=('unknown')
groups=('c-fonts')
makedepends=('git')
source=("$pkgbase::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_ttf-ceva-c2-git() {
	provides=('ttf-font')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$pkgbase"
	install -Dm 644 ceva-c2.ttf -t "$pkgdir/usr/share/fonts/TTF/"
}

package_otf-ceva-c2-git() {
	provides=('otf-font')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$pkgbase"
	install -Dm 644 ceva-c2.otf -t "$pkgdir/usr/share/fonts/OTF/"
}

package_ttf-ceva-cm-git() {
	provides=('ttf-font')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$pkgbase"
	install -Dm 644 ceva-cm.ttf -t "$pkgdir/usr/share/fonts/TTF/"
}

package_ttf-linek-git() {
	provides=('ttf-font')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$pkgbase"
	install -Dm 644 linek_.ttf -t "$pkgdir/usr/share/fonts/TTF/"
}

package_ttf-x-scale-git() {
	provides=('ttf-font')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$pkgbase"
	install -Dm 644 x-scale.ttf -t "$pkgdir/usr/share/fonts/TTF/"
}
