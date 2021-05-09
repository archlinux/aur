# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=mopidy-advanced-scrobbler
pkgver=1.0.0
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
sha256sums=("3a586945cd1d0b97a46d78386c1749801d267e4c34d109a55467bd9b1fc56d94")

package() {
    cd "Mopidy-Advanced-Scrobbler-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
