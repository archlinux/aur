# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=mopidy-advanced-scrobbler
pkgver=2.0.0
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
    "python-marshmallow"
    "python-marshmallow-enum"
)
source=("https://pypi.io/packages/source/M/Mopidy-Advanced-Scrobbler/Mopidy-Advanced-Scrobbler-${pkgver}.tar.gz")
sha256sums=("4ea72e3146091039c3e70f0c206daf1167209c386059a013ec346209fd86323b")

package() {
    cd "Mopidy-Advanced-Scrobbler-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
