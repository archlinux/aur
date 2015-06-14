# Maintainer: Immae <ismael.bouya@normalesup.org>

pkgname=patacrep-git
pkgver=20150614
pkgrel=1
pkgdesc="Engine for LaTeX songbooks"
arch=('any')
url="http://www.patacrep.com"
license=('GPL')
depends=('python' 'python-ply' 'python-jinja' 'python-chardet'
         'python-unidecode' 'texlive-fontsextra' 'lilypond')
makedepends=('python-setuptools')
source=("patacrep::git://github.com/patacrep/patacrep.git#branch=master")
sha256sums=(SKIP)

build() {
  cd "$srcdir/patacrep"
  python setup.py build
}

package(){
  cd "$srcdir/patacrep"
  python setup.py install --root="${pkgdir}"
}

