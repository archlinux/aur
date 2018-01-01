# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Matthew Lawson <mmlawson@ucdavis.edu>

pkgname=python-stscitools
pkgver=3.4.11
pkgrel=1
pkgdesc="STSCI Tools"
arch=('i686' 'x86_64')
depends=('python')
url="https://github.com/spacetelescope/stsci.tools"
source=("https://files.pythonhosted.org/packages/source/s/stsci.tools/stsci.tools-${pkgver}.tar.gz")
license=('BSD')
md5sums=('1b2f59eb444ebb816fd5587781fee63e')

build() {
    cd "${srcdir}/stsci.tools-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/stsci.tools-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
