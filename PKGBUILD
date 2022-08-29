# Maintainer: wszqkzqk <wszqkzqk@qq.com>

pkgname=vesta-rpm
pkgver=3.5.8
pkgrel=2
pkgdesc="A 3D visualization program for structural models, volumetric data such as electron/nuclear densities, and crystal morphologies. "
arch=('x86_64')
url="http://www.jp-minerals.org/vesta/en/"
license=('VESTA LICENSE')
conflicts=('vesta' 'vesta-bin')
provide=('vesta')
depends=(
	'gtk3' 'glu' 'desktop-file-utils' 'libxtst'  'java-environment-common'
)
makedepends=(
	'tar'
)
source=(
	"http://jp-minerals.org/vesta/archives/${pkgver}/vesta-${pkgver}-1.x86_64.rpm"
)
sha256sums=('c2a552d8bcd68cf5b25d698f2330d6b345469286c8f18990bd4a1c93c587bf84')

package() {
            cp -a "${srcdir}/usr" "${pkgdir}"
}
