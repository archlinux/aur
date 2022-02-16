# Maintainer: Alexander Kempen <alexander dot kempen at posteo dot de>
# Contributor: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=clipster
pkgver=2.1.1
pkgrel=1
pkgdesc="Python clipboard manager"
arch=("any")
url="https://github.com/mrichar1/clipster"
license=("AGPL")
depends=("python" "python-gobject" "python-pip" "libwnck3")
makedepends=("git" "python-setuptools")
source=("${pkgname}-${pkgver}::git+https://github.com/mrichar1/clipster.git#tag=${pkgver}")
sha256sums=("SKIP")
provides=("clipster")
conflicts=("clipster-git")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
