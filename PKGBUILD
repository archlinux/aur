# Maintainer: Bidossessi Sodonon

pkgname=python2-jcconv
_pkgname=jcconv
pkgver=0.2.3
pkgrel=1
pkgdesc="JapaneseCharacterCONVerter, interconvert hiragana, katakana, halfwidth kana"
url=http://github.com/taichino/jcconv
arch=('any')
license=(MIT)
provides=("$_pkgname")
depends=(
    'python2'
)
source=("https://pypi.python.org/packages/source/j/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
package()
{
  cd ${srcdir}/${_pkgname}-${pkgver}
  # Force package data inclusion
  python2 setup.py install --root="${pkgdir}"
}
md5sums=('b51dc04034f9aef21c955ea6d19571d9')
