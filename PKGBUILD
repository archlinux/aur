# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=wordcloud
pkgname=python-wordcloud
pkgver=1.8.0
pkgrel=1
pkgdesc="A little word cloud generator in Python"
arch=('any')
url="https://github.com/amueller/word_cloud"
license=('Apache')
makedepends=('python-setuptools')
depends=('python' 'python-matplotlib' 'python-pillow' 'python-numpy')
#source=("https://files.pythonhosted.org/packages/6b/9f/27cec92eee9f1d4f02f986ad0cc6dfc0797b117be6e968da8f92c6c183aa/$_pkgname-$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/27/3f/8ff149cfce0bffed6b475c1eec6f81b67464405c115c05e512621f7f41d8/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('35563d96802d29c876ef8fd9e83304ef796cee40b2e51c0a7fa570d468073236')

# vim:set ts=2 sw=2 et:
