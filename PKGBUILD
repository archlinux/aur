# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>

pkgname='python-pyogg'
pkgver=0.6.14a1
pkgrel=1
pkgdesc="Flac, ogg, and opus python library"
url="https://github.com/Zuzu-Typ/PyOgg"
license=('unlicense')
arch=('any')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/P/PyOgg/PyOgg-${pkgver}.tar.gz")
sha512sums=('a8176efed1088c09991b764eb594b67c75b15b1af6031657ae6083dd77370678c2af488441bef20a6a0103409813c8f503830d77759c7179d93a3f3c5861de3f')

package() {
    cd "${srcdir}/PyOgg-${pkgver}"
 	python setup.py install --root="${pkgdir}" --optimize=1
 	install -Dm644 "${srcdir}/PyOgg-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

