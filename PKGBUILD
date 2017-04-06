# Maintainer: jdn06 <jdn06.jdn06@outlook.fr>

pkgname=pyromaths
pkgver=15.10
pkgrel=2
pkgdesc="French program to create mathematical exercises and models"
arch=(any)
license=('GPL3')
depends=('python2-pyqt4' 'python2-lxml' 'texlive-pstricks' 'texlive-latexextra')
makedepends=('python2-setuptools')
optdepends=('texlive-fontsextra' 'texlive-pictures')

source=(http://www.pyromaths.org/telecharger/$pkgname-$pkgver-sources.tar.bz2)
sha256sums=('3e54004dfe7159b0dcf8aa1e7a258abb54383e0d95fa6377489d65c51cfa1482')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

