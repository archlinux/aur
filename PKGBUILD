# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: tuftedocelot@fastmail.fm
# Contributor: flu

pkgname=mopidy-tunein
pkgver=1.1.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from TuneIn"
arch=("any")
url="https://github.com/kingosticks/mopidy-tunein"
license=("Apache")
depends=(
    "mopidy"
    "python"
    "python-setuptools"
    "python-pykka"
    "python-requests"
)
source=("https://github.com/kingosticks/mopidy-tunein/archive/v${pkgver}.tar.gz")
sha256sums=("442aedb87b65ed61cad3eb8dd01f16ebf9f62fae4a6dd948ded73f1604ee8de2")

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
