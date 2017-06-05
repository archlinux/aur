# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=wordcloud
pkgname=python2-wordcloud
pkgver=1.3.1
pkgrel=1
pkgdesc="A little word cloud generator in Python"
arch=('any')
url="https://github.com/amueller/word_cloud"
license=('Apache')
depends=('python2' 'python2-matplotlib' 'python2-pillow' 'python2-numpy')
source=("https://pypi.python.org/packages/be/8b/4e47893d91d2408028b80815a30f128e840104e5ed10999c0121f5f1a7f3/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('a5b974e29f7677b66047de2fb214dbed8763c5f5e7b72041ecf2b4040722dce0')

# vim:set ts=2 sw=2 et:
