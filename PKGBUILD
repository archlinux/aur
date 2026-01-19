# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=python-pdbfixer
pkgver=1.12
pkgrel=1
pkgdesc="fixing problems in Protein Data Bank files in preparation for simulating them."
arch=(any)
url="https://github.com/openmm/pdbfixer"
license=('MIT')
depends=('openmm' 'python-numpy')
optdepends=('python-legacy-cgi'
)

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('a5c0b05dfaf2cdcad3b8ffc9ee1e6a955628aade0dda653da04d4a12ba4fe3ec')

package() {
    cd $srcdir/pdbfixer-${pkgver}
    python3 setup.py install --prefix ${pkgdir}/usr
}
