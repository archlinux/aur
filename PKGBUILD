# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=wordcloud
pkgname=python-wordcloud
pkgver=1.4.1
pkgrel=1
pkgdesc="A little word cloud generator in Python"
arch=('any')
url="https://github.com/amueller/word_cloud"
license=('Apache')
depends=('python' 'python-matplotlib' 'python-pillow' 'python-numpy')
source=("https://pypi.python.org/packages/bc/e8/cab8479b25297b3847cfb55e85a5014e8c53b80e513eaf1ba58c7b3a6acd/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('f52e719dfefc499806539258961d6513f97d2eb28f9870827839eaff1e77d8ea')

# vim:set ts=2 sw=2 et:
