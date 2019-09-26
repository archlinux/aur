# Maintainer: Hristo Kamenov <hkamenov123@gmail.com>
pkgname=bashball
pkgver=1.6.4
pkgrel=1
pkgdesc="A tool for compiling bash projects in a single script"
arch=('any')
url="https://github.com/blkgoose/bashball"
license=('GPL')
depends=('bash')
source=("https://github.com/blkgoose/bashball/releases/download/v$pkgver/bashball")
md5sums=('deaf94b3d8fed2fdd0f597552447bb11')

package() {
	install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
