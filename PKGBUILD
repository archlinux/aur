# Maintainer: Nils Amiet <amietn@foobar>
pkgname=vcsi
pkgver=7
pkgrel=2
pkgdesc="Create video contact sheets, thumbnails"
arch=(any)
url="https://github.com/amietn/vcsi"
license=('MIT')
groups=()
depends=(python ffmpeg python-numpy python-pillow python-jinja python-texttable ttf-dejavu)
makedepends=(git)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${pkgname}::git+https://github.com/amietn/vcsi.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
