# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-birdseye
_module=birdseye
pkgver=0.9.0
pkgrel=1
pkgdesc="Graphical Python debugger which lets you view the values of all evaluated expressions"
url="http://github.com/alexmojaki/birdseye"
depends=(python-littleutils python-flask-humanize python-humanize python-flask-humanize python-cheap_repr python-outdated python-sqlalchemy python-cached-property python-future python-asttokens)
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/d3/9e/de1d443e0b307f696a9103b4c8fd5e7f253a51a366124139446b7d9c7c23/birdseye-${pkgver}-py3-none-any.whl")
noextract=("birdseye-${pkgver}-py3-none-any.whl")
sha256sums=('03c249beaf4770efa8751ed32d5d3c5e6609180339121bc54fbf75531b51fc43')

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
