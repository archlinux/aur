# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Antergos Developers <dev@antergos.com>

pkgname=iso-flag-png
pkgver=1.0.2
pkgrel=1
pkgdesc='ISO country flags in PNG format'
arch=('any')
groups=('cinnamon')
url='https://github.com/linuxmint/flags'
license=('custom')
source=("https://ftp.fau.de/mint/packages/pool/main/f/flags/flags_${pkgver}.tar.xz")
sha256sums=('4726333387e5795d49a2a54f7ffbbdb5b50f47b6aa20533a78b6eded347ca57c')

package() {
	cd 'flags'
	cp -R 'usr' "${pkgdir}"
}
