# Maintainer: Jerry Xiao <aur@mail.jerryxiao.cc>
# Contributor: TildeHacker <contact@tildehacker.com>

pkgname=ideapad-cm
pkgver=0.1.1
pkgrel=1
pkgdesc="A script to enable/disable battery conservation mode in Lenovo Ideapad laptops."
arch=('any')
url="https://github.com/archlinux-jerry/ideapad-conservation-mode"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2c904bffcbaed7354a21111ecd10a508c606ca368b1cbbc92d279c028f864ddd')

package() {
	install -Dm755 -t "$pkgdir/usr/bin/" "ideapad-conservation-mode-${pkgver}/${pkgname}"
}
