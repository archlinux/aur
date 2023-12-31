# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=wordcloud
pkgname=python-wordcloud
pkgver=1.9.3
pkgrel=1
pkgdesc="A little word cloud generator in Python"
arch=('any')
url="https://github.com/amueller/word_cloud"
license=('Apache')
makedepends=('python-setuptools' 'cython')
depends=('python' 'python-matplotlib' 'python-pillow' 'python-numpy')
source=("https://files.pythonhosted.org/packages/7c/60/5f927145b65de0f299079db846c89fa031d56e4df9764607add12a03714e/$_pkgname-$pkgver.tar.gz")
sha256sums=('a9aa738d63ed674a40f0cc31adb83f4ca5fc195f03a6aff6e010d1f5807d1c58')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
