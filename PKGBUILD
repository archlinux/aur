# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Old Maintainer: Mangeshrex <ex835138 {at} gmail {dot} com>

pkgname=rxfetch
pkgver=1.0
pkgrel=2

pkgdesc="A minimal but geeky fetch utility"
arch=('any')
url="https://github.com/mangeshrex/rxfetch"
license=('GPL3')

depends=('bash')
makedepends=('git')

source=("git+https://github.com/mangeshrex/rxfetch")
b2sums=('SKIP')

package() {
	cd "$pkgname"

	install -vd "$pkgdir/usr/bin/"
	install -vDm 755 rxfetch "$pkgdir/usr/bin/"

	install -vdm 755 "$pkgdir/usr/share/fonts/ttf-material-design-icons"
	cp -rv "ttf-material-design-icons/" "$pkgdir/usr/share/fonts/"

	install -vDm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
