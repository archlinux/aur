# Maintainer: Marcin Kornat <rarvolt+aur@gmail.com>

pkgname=adrgen
pkgver=0.4.1
_pkgver=0.4.1-beta
pkgrel=1
pkgdesc="A command-line tool for generating and managing Architecture Decision Records"
arch=('x86_64')
url="https://github.com/asiermarques/adrgen"
license=('MIT')
source=("https://github.com/asiermarques/adrgen/releases/download/v${_pkgver}/adrgen_Linux_x86_64.tar.gz")
sha256sums=('36b29d5c9d84789d889b722b62c95a0d651473490a865e7bd04b36b09fb57b65')

package() {
	install -Dm755 adrgen "${pkgdir}/usr/bin/adrgen"
}
