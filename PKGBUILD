# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=wordcloud
pkgname=python-wordcloud
pkgver=1.8.2.2
pkgrel=1
pkgdesc="A little word cloud generator in Python"
arch=('any')
url="https://github.com/amueller/word_cloud"
license=('Apache')
makedepends=('python-setuptools')
depends=('python' 'python-matplotlib' 'python-pillow' 'python-numpy')
source=("https://files.pythonhosted.org/packages/71/8b/0feea1341a29c645ca9dbc7f453b1101ee0725059977c7fce23e1bd75b83/$_pkgname-$pkgver.tar.gz")
sha256sums=('523db887e47e840eb5c2e60428243bb1d7439fdc60f89626b17bafa1be64459c')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
