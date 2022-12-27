# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>

pkgname='bython'
pkgver=0.8
pkgrel=1
pkgdesc="Python with braces. Because Python is awesome, but whitespace is awful."
url="https://github.com/mathialo/bython"
license=('MIT')
arch=('any')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/9f/b1/b0af10aac41ddb0a0911f47d282f45633cc1fa72e7b5a240cb2673ca0115/bython-${pkgver}.tar.gz")
sha512sums=('d4f424a4ca01eeda33d654b35e946b33db22ecaa52f8abe82808e5f085c509ac3bf74174b968f6c72be662e5618f2a087e2346fd12b7db513dfa0a7d121c02f6')

package() {
    cd "${srcdir}/bython-${pkgver}"
 	python setup.py install --root="${pkgdir}" --optimize=1
}

