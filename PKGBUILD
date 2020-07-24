# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-polychord
pkgver='1.18.1'
pkgrel=2
pkgdesc="Next generation nested sampling (python library)"
arch=(any)
url="https://github.com/PolyChord/PolyChordLite"
groups=()
depends=('gcc-fortran' 'openmpi')
license=('custom')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/PolyChord/PolyChordLite/archive/${pkgver}.tar.gz")
sha256sums=('00e56353a48727a34e54a688d2fc021d8850ab8b6788be1c7056f1c68d417873')
package() {
    cd "${srcdir}/PolyChordLite-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 
}
