# Maintainer: Nils Amiet <amietn@foobar>
pkgname=vcsi-git
pkgver=7
pkgrel=2
pkgdesc="Create video contact sheets, thumbnails"
arch=(any)
url="https://github.com/amietn/vcsi"
license=('MIT')
groups=()
depends=(python ffmpeg python-numpy python-pillow python-jinja python-texttable ttf-dejavu python-parsedatetime)
makedepends=()
provides=(vcsi)
conflicts=(vcsi)
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${pkgname}::git+https://github.com/amietn/vcsi.git")
sha256sums=('SKIP')

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
