# Maintainer: b6b <b6bb at pm dot me>

pkgname=python-pysubs2
pkgver=0.2.4
pkgrel=1
pkgdesc='A Python library for editing subtitle files'
arch=(any)
url=https://pypi.org/project/pysubs2
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/8a/83/5ebaf5a1d6f04ae21c2bdc16dcdba4a950b1c0b10f0fe83e71f9c5738e33/pysubs2-$pkgver.tar.gz")
sha256sums=(07f9bb5da0efe8238b88c9ee35cc42ad8c6a3ffc2e4bf8f3bff6d463d02a4b6f)

build() {
  cd "${srcdir}/pysubs2-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/pysubs2-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
