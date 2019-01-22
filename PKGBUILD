# Maintainer: Yamakaky <yamakaky@yamaworld_fr>
pkgname=safeeyes
pkgver=2.0.7
pkgrel=1
pkgdesc="A Free and Open Source tool for Linux users to reduce and prevent repetitive strain injury (RSI)."
arch=("any")
url="https://github.com/slgobinath/SafeEyes"
license=("GPL3")
depends=("alsa-utils"
         "hicolor-icon-theme"
         "libappindicator-gtk3"
         "python"
         "python-babel"
         "python-dbus"
         "python-gobject"
         "python-psutil"
         "python-xlib"
         "xorg-xprop")
makedepends=("python-setuptools")
optdepends=("xprintidle: better idle timer")
source=(safeeyes-$pkgver.tar.gz::"https://github.com/slgobinath/SafeEyes/archive/v$pkgver.tar.gz")
sha1sums=('9199045ba7b1e95d73af4645b2df9e80c8be1c6b')

package() {
    cd "$srcdir/SafeEyes-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
