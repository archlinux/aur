# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=mopidy-alarmclock
pkgver=0.1.9
pkgrel=1
pkgdesc="Mopidy extension using it as an alarm clock."
arch=("any")
url="https://github.com/DavisNT/mopidy-alarmclock"
license=("Apache")
depends=(
    "mopidy"
    "python"
    "python-setuptools"
    "python-pykka"
)
source=("https://pypi.io/packages/source/M/Mopidy-AlarmClock/Mopidy-AlarmClock-${pkgver}.tar.gz")
sha256sums=("8897f29f8621aa8e74ab1d307338df8078a4c9590285e29a93630d958a246ce8")

package() {
    cd "Mopidy-AlarmClock-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
