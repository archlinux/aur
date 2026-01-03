# Maintainer: T-1990 <address at domain dot>

pkgname=otf-erewhon-math 
pkgver=0.72
pkgrel=1
pkgdesc='Erewhon-Math is an Utopia based OpenType maths font.'
url="https://ctan.org/pkg/erewhon-math"
license=(custom:OFL)
arch=(any)

source=("https://mirrors.ctan.org/fonts/erewhon-math.zip")
md5sums=('f750abe4d4ec96877e4089f0a65ff868')

package() {
	install -Dm644 "$srcdir/erewhon-math/"*.otf -t "${pkgdir}/usr/share/fonts/OTF"
}
