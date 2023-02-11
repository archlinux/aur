# Maintainer: gobinath <slgobinath@gmail.com>
# Maintainer: yigits <yigit@yigitsever.com>
# Maintainer: otuva <onralpakin@gmail.com>
# Maintainer: PopeRigby <poperigby@mailbox.org>
# Maintainer: ilario <iochesonome@gmail.com>

pkgname=safeeyes
pkgver=2.1.5
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
sha1sums=('df7cb66a7f41d32db02bf80afb2806b794cce3c5')

package() {
    cd "$srcdir/SafeEyes-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
