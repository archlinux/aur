# Maintainer: Yamakaky <yamakaky@yamaworld_fr>
pkgname=safeeyes
pkgver=2.1.3
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
makedepends=("python-setuptools" "python-pip")
optdepends=("xprintidle: for Smart Pause plugin" "python-croniter: for Health Stats plugin" "wlrctl: for Do Not Disturb plugin in Wayland")
source=(safeeyes-$pkgver.tar.gz::"https://github.com/slgobinath/SafeEyes/archive/v$pkgver.tar.gz")
sha1sums=('aaf37038c8bdc51bb76352682309fcd471f0c49c')

package() {
    cd "$srcdir/SafeEyes-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
