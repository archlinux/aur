# Maintainer: T-1990 <address at domain dot>

pkgname=otf-garamond-math 
pkgver=20190816
pkgrel=1
pkgdesc='Garamond-Math is an open type math font matching EB Garamond.'
url="https://github.com/YuanshengZhao/Garamond-Math"
license=('OFL-1.1')
arch=(any)
makedepends=('git')

source=("git+https://github.com/YuanshengZhao/Garamond-Math.git")
md5sums=('SKIP')

package() {
	install -Dm644 "$srcdir/Garamond-Math/Garamond-Math.otf" -t "${pkgdir}/usr/share/fonts/OTF"
}
