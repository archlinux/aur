# Maintainer: wszqkzqk <wszqkzqk@qq.com>

pkgname=vesta-rpm
pkgver=3.5.8
pkgrel=1
pkgdesc="A 3D visualization program for structural models, volumetric data such as electron/nuclear densities, and crystal morphologies. "
arch=('x86_64')
url="http://www.jp-minerals.org/vesta/en/"
license=('VESTA LICENSE')
conflicts=('vesta' 'vesta-bin')
depends=(
	'gtk3' 'glu' 'desktop-file-utils' 'libxtst'  'java-environment-common'
)
makedepends=(
	'tar'
)
source=(
	"http://jp-minerals.org/vesta/archives/${pkgver}/vesta-${pkgver}-${pkgrel}.x86_64.rpm"
)
sha256sums=('6fba78640d449a4c0afd9143658106ee3668be235a9bb4109fdc5ff4828487d8')

package() {
            cp -a "${srcdir}/usr" "${pkgdir}"
}
