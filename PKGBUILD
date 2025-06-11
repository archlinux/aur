pkgname=python-partdb-labeler
_origpkgname=partdb-labeler
pkgver=0.2.1
pkgrel=1
pkgdesc="print PartDB labels on a Zebra label printer"
arch=("x86_64")
url='https://gitlab.alfter.us/salfter/partdb-labeler/'
license=("None")
depends=(
	"python-requests"
	"python-zebra"
	"python-qrcode"
	"python-pillow"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-setuptools"
)
source=("https://gitlab.alfter.us/salfter/partdb-labeler/-/archive/v${pkgver}/partdb-labeler-v${pkgver}.tar.bz2")
sha256sums=("f9a471e1a73c660b4f7cf1f11786d6f37057abbd6d00dad8d46fb33b1ee01368")
package() {
	cd "${_origpkgname}-v${pkgver}" || exit
	python setup.py install --root="$pkgdir" --optimize=1
}
