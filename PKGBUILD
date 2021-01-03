# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Fergus Longley <ferguslongley at gmail dot com>
# Contributer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-scrobbler
pkgver=2.0.1
pkgrel=1
pkgdesc="Mopidy extension for scrobbling played tracks to Last.fm"
arch=("any")
url="https://github.com/mopidy/mopidy-scrobbler"
license=("Apache")
depends=(
    "python"
    "python-setuptools"
    "mopidy"
    "python-pylast"
    "python-pykka"
)
makedepends=("python")
source=("https://pypi.io/packages/source/M/Mopidy-Scrobbler/Mopidy-Scrobbler-2.0.1.tar.gz")
sha256sums=("001920edc5433678091cb74c56e39c57ffcdb280396447b07d6fbe4eba7a7d87")

package() {
    cd "Mopidy-Scrobbler-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
