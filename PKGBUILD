# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=mopidy-advanced-scrobbler
pkgver=1.0.2
pkgrel=1
pkgdesc="Mopidy extension for comprehensive management of Last.fm scrobbles"
arch=("any")
url="https://github.com/djmattyg007/mopidy-advanced-scrobbler"
license=("Apache")
depends=(
    "mopidy"
    "python"
    "python-setuptools"
    "python-pykka"
    "python-pylast"
    "python-music-metadata-filter"
    "python-dataclasses-json"
)
source=("https://pypi.io/packages/source/M/Mopidy-Advanced-Scrobbler/Mopidy-Advanced-Scrobbler-${pkgver}.tar.gz")
sha256sums=("47273e4dde46982d13012f63e8d2aea2580844e0688fd6bd2f9a3ce04460b202")

package() {
    cd "Mopidy-Advanced-Scrobbler-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
