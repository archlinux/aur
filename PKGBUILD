pkgname="friendlyvri-git"
_pkgname="friendlyvri"
pkgver=1.0.0
pkgrel=1
pkgdesc="A Virtual Radio Interferometer application"
arch=("x86_64")
url='https://github.com/crpurcell/friendlyVRI'
license=('MIT')
makedepends=()
depends=('tk' 'python-numpy' 'python-matplotlib' 'python-scipy')
source=("$pkgname::git+https://github.com/crpurcell/friendlyVRI.git")
sha256sums=('SKIP')

package() {
	install -d "${pkgdir}/opt"
	cp -r "${srcdir}/${pkgname}/" "${pkgdir}/opt/${_pkgname}"
}


