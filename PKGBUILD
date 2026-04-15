# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=python-datafiles
pkgver=2.5
pkgrel=2
pkgdesc="File-based ORM for dataclasses."
arch=('any')
url="https://github.com/jacebrowning/datafiles"
license=('MIT')
depends=('python'
         'python-cached-property'
         'python-classproperties'
         'python-json-five'
         'python-minilog'
         'python-parse'
         'python-ruamel-yaml'
         'python-tomlkit')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/e7/20/77ffd95cab96a5db9460d9a038d2d5c49c1e18995e7735a2e92e9cb1798e/datafiles-${pkgver}-py3-none-any.whl")
noextract=("datafiles-${pkgver}-py3-none-any.whl")
sha256sums=('3c4b50339b698ef7096f7244233e80c5686838f0dcd4c77bfe7e0e52ddea75de')

package() {
    python -m installer --destdir="$pkgdir" "$srcdir/datafiles-${pkgver}-py3-none-any.whl"
}
