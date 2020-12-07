# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Fergus Longley <ferguslongley at gmail dot com>
# Contributer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-scrobbler
pkgver=2.0.0
pkgrel=2
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
source=("https://files.pythonhosted.org/packages/78/30/8ca1603b687a37b3773f574c5a419d7eea659d52f4018a93c46471998da1/Mopidy-Scrobbler-${pkgver}.tar.gz")
sha256sums=("2411e92303cd5950f5a24ef476638bffc066b43f79e7422b3727b7e120e91d69")

package() {
    cd "Mopidy-Scrobbler-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
