# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-pywikibot
_module='pywikibot'
pkgver=3.0.20190106
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

sha256sums=('73ac3db29bb1f984098af42182ceb336a813ed1e0143a0b0d5f479f8b88c4b3e')
