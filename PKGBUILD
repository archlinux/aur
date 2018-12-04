# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-pywikibot
_module='pywikibot'
pkgver=3.0.20181203
pkgrel=1
pkgdesc="Python MediaWiki Bot Framework"
url="https://www.mediawiki.org/wiki/Pywikibot"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pywikibot/pywikibot-$pkgver.tar.gz")

build() {
    cd "$srcdir/$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_module-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('c1c5d8fca17fe4a363186312340efebbd7b41fcbf12a1189cd4bb3010086e1ee')
