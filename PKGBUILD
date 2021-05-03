# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-polychord
pkgver='1.18.2'
pkgrel=1
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
sha256sums=('d6dac54c88aea585adbc13b1a120a2c447967f6c1fae86da0ba7e9a9c17f871c')
package() {
    cd "${srcdir}/PolyChordLite-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
