# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=wordcloud
pkgname=python-wordcloud
pkgver=1.7.0
pkgrel=1
pkgdesc="A little word cloud generator in Python"
arch=('any')
url="https://github.com/amueller/word_cloud"
license=('Apache')
depends=('python' 'python-matplotlib' 'python-pillow' 'python-numpy')
source=("https://files.pythonhosted.org/packages/6b/9f/27cec92eee9f1d4f02f986ad0cc6dfc0797b117be6e968da8f92c6c183aa/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('bad2b990350a869e6e35c05d292784b050da6068109068425961aad4ae4fefb2')

# vim:set ts=2 sw=2 et:
