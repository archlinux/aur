# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=wordcloud
pkgname=python-wordcloud
pkgver=1.9.2
pkgrel=1
pkgdesc="A little word cloud generator in Python"
arch=('any')
url="https://github.com/amueller/word_cloud"
license=('Apache')
makedepends=('python-setuptools')
depends=('python' 'python-matplotlib' 'python-pillow' 'python-numpy')
source=("https://files.pythonhosted.org/packages/fe/f9/35e6f31e57c2f51351625045c9d1ad2fc33fe79cac21973f8985c7dbcbb9/$_pkgname-$pkgver.tar.gz")
sha256sums=('71062ba6bfeaf1a7f8b6f18f6a8a7a810ef10973ebd9aa10c04d9fff690363d3')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
