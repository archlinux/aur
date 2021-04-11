# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=python-tablign
pkgver=0.3.3
pkgrel=1
pkgdesc="Aligns columns in your ASCII tables"
arch=('any')
url="https://github.com/nschloe/tablign"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/t/tablign/tablign-$pkgver.tar.gz")
sha256sums=('ec4d662d2a9dbbc0490947e23af637a45b2c0585283db3325e87b04ce8605b7e')

package() {
  cd tablign-$pkgver

  python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
