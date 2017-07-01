# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Antergos Developers <dev@antergos.com>

pkgname=iso-flag-png
pkgver=1.0.1
pkgrel=1
pkgdesc='ISO country flags in PNG format'
arch=('any')
groups=('cinnamon')
url='https://github.com/linuxmint/flags'
license=('custom')
source=("https://github.com/linuxmint/flags/archive/${pkgver}.tar.gz")
sha256sums=('db328281d979600ce4b8cbe47a224b22de233126ee106c61112cf54437e17713')

package() {
	cd "flags-${pkgver}"
	cp -R 'usr' "${pkgdir}"
}
