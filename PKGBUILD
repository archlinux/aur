pkgname="cosmonium-bin"
_pkgname="cosmonium"
pkgver=0.3.0
pkgrel=1
pkgdesc="3D astronomy and space exploration program."
arch=("x86_64")
url='https://github.com/cosmonium/cosmonium'
license=('GPL3')
makedepends=()
depends=()
source=("https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}.dev581/${_pkgname}-${pkgver}.dev581_manylinux2014_x86_64.tar.gz")
sha256sums=('ae51ac3c85f10bc925ad29d5fddf424515c23397c00abe5069511a04ecd4f767')


package() {
	mkdir -vp "${pkgdir}/opt/${_pkgname}"
	cp -r "${srcdir}/${_pkgname}/" "${pkgdir}/opt/"
}
