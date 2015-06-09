# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=python2-nltk_contrib-git
_pkgname=nltk_contrib
pkgver=20141014
pkgrel=1
pkgdesc="Natural Language Toolkit, Contrib Area"
url="http://www.nltk.org/"
arch=('any')
license=('APACHE')
depends=('python2-nltk' 'git')
source=('git+https://github.com/nltk/nltk_contrib.git')
sha1sums=('SKIP')

pkgver() {
  date +%Y%m%d
}

build() {
  cd ${srcdir}/${_pkgname}

  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}

  python2 setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
