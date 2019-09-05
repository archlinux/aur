# Maintainer: Hristo Kamenov <hkamenov123@gmail.com>
pkgname=bashball
pkgver=1.6.3
pkgrel=1
pkgdesc="A tool for compiling bash projects in a single script"
arch=('any')
url="https://github.com/blkgoose/bashball"
license=('GPL')
depends=('bash')
source=("https://github.com/blkgoose/bashball/releases/download/v$pkgver/bashball")
md5sums=('122df628791cc763c12d665920aa94e7')

package() {
	install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
