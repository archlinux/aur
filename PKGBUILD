# Maintainer: b6b <b6bb at pm dot me>

pkgname=python-cueparser
pkgver=1.0.0
pkgrel=1
pkgdesc='Simple cue file parser written in python'
arch=(any)
url=https://pypi.org/project/CueParser
license=(custom)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/3c/14/947ea1645ec92aefabf6f17141a44089c8b85b59527a9600f84315587175/CueParser-$pkgver.tar.gz")
sha256sums=(2a33d51652a0ad87348975fb314610ef39066a2ae64e89739eaaea33d058e085)

build() {
  cd "${srcdir}/CueParser-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/CueParser-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
