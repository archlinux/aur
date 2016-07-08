# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>

_pkgname=awesome-slugify
pkgname=python-$_pkgname
pkgver=1.6.5
pkgrel=1
pkgdesc="Flexible slugify function"
arch=('any')
url="https://github.com/dimka665/awesome-slugify"
license=('GPL3')
depends=('python'
         'python-regex'
         'python-unidecode'
         'python-nose')
source=("https://pypi.python.org/packages/34/39/79ef4e640c3651b40de7812f5fcd04698abf14de4f57a81e12b6c753d168/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('bbdec3fa2187917473a2efad092b57f7125a55f841a7cf6a1773178d32ccfd71')

# vim:set ts=2 sw=2 et:
