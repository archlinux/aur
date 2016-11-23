# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=wordcloud
pkgname=python-wordcloud
pkgver=1.2.1
pkgrel=1
pkgdesc="A little word cloud generator in Python"
arch=('any')
url="https://github.com/amueller/word_cloud"
license=('Apache')
depends=('python' 'python-pillow' 'python-numpy')
source=("https://pypi.python.org/packages/e6/fe/d3b05bf5ac8d29160aafdd9995db5fa8b8cad48a11e75dbd6b04d78190bb/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('f5f520f63ef8d468a93ca23ec6367167aae8e74fcf921b1bd522b0f6a05af2fc')

# vim:set ts=2 sw=2 et:
