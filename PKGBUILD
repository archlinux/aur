# Maintainer: Isabel <isabel@isabelroses.com>
pkgname=catppuccinifier-cli-bin
_pkgname=catppuccinifier
pkgver=8.0.0
pkgrel=1
pkgdesc="An comand line tool to catppuccinifiy your images."
arch=("x86_64")
url="https://github.com/lighttigerXIV/catppuccinifier"
license=()
depends=()
provides=('catppuccinifier')
conflicts=('catppuccinifier')
makedepends=('unzip')
source=("https://github.com/lighttigerXIV/${_pkgname}/releases/download/${pkgver}/Catppuccinifer-Linux-${pkgver}.zip")
md5sums=('SKIP')

build() {
    unzip -o "Catppuccinifer-Linux-${pkgver}.zip"
}

package() {
	install -Dm755 "${srcdir}/Catppuccinifer-Linux-${pkgver}/installation-files/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
