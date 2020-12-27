# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=wordcloud
pkgname=python-wordcloud
pkgver=1.8.1
pkgrel=1
pkgdesc="A little word cloud generator in Python"
arch=('any')
url="https://github.com/amueller/word_cloud"
license=('Apache')
makedepends=('python-setuptools')
depends=('python' 'python-matplotlib' 'python-pillow' 'python-numpy')
source=("https://files.pythonhosted.org/packages/be/33/5bdd39587f0e8ede3fe12d9d16d6f1fb5e7a43f29621604a949ee362d013/$_pkgname-$pkgver.tar.gz")
sha256sums=('e6ef771aac17c1cf8558c8d5ef025796184066d7b78f8118aefe011fb0d22952')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
