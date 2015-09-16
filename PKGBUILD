# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=goose-extractor
pkgname=python2-goose
pkgver=1.0.25
pkgrel=1
pkgdesc="HTML content and article extractor for Python, based on the Java/Scala version"
arch=('any')
url="https://github.com/grangier/python-goose"
license=('Apache')
depends=('python2' 'python2-pillow' 'python2-lxml' 'python2-cssselect' 'python2-jieba' 'python2-beautifulsoup4' 'python2-nltk')
source=("https://pypi.python.org/packages/source/g/$_pkgname/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

sha512sums=('f74eed90366993560063feccc8626592a83c06adf096b720aa4cf36a3e1bdaa2521d4156857cafcae31fa04fa97a937510f29dc3e0a8b427ad783af0122c86f5')

# vim:set ts=2 sw=2 et:
