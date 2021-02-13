# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Emanuel Evans <mail@emanuel.industries>

pkgname=mopidy-pandora
pkgver=1.1.1
pkgrel=1
pkgdesc="Mopidy extension for playing music from Pandora"
arch=("any")
url="https://github.com/mopidy/mopidy-pandora"
license=("Apache")
depends=(
    "mopidy"
    "python"
    "python-setuptools"
    "python-pykka"
    "python-requests"
)
source=("https://github.com/mopidy/mopidy-pandora/archive/v${pkgver}.tar.gz")
sha256sums=("da1901fa0ee72181fb4607cb872cc7042beaf0a091ab2e5a44607bd733291dcc")

package() {
    cd "mopidy-pandora-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
