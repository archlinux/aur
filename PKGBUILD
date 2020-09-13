# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>

pkgname='python-pyopenal'
pkgver=0.7.11a1
pkgrel=1
pkgdesc="OpenAL python library"
url="https://github.com/Zuzu-Typ/PyOpenAL"
license=('unlicense')
arch=('any')
optdepends=('python-pyogg: flac, ogg, and opus support')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/P/PyOpenAL/PyOpenAL-${pkgver}.tar.gz")
sha512sums=('4d6a292f0db1207d88d87dca68f32128665f275b3aaf72944d4958073ede6d2fc43f265b84740d354b750e3ca73ed859ac03239d6e0dfa6312041cb48bfcfedb')

package() {
    cd "${srcdir}/PyOpenAL-${pkgver}"
 	python setup.py install --root="${pkgdir}" --optimize=1
 	install -Dm644 "${srcdir}/PyOpenAL-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

