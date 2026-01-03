# Maintainer: T-1990 <address at domain dot>

pkgname=otf-garamond-math 
pkgver=20220103
pkgrel=1
pkgdesc='Garamond-Math is an open type math font matching EB Garamond.'
url="https://https://ctan.org/pkg/garamond-math"
license=('OFL-1.1')
arch=(any)

source=("https://mirrors.ctan.org/fonts/garamond-math.zip")
md5sums=('c473aa0a4fa588747ab1cf72a8f6dc9b')

package() {
	install -Dm644 "$srcdir/garamond-math/Garamond-Math.otf" -t "${pkgdir}/usr/share/fonts/OTF"
}
