# Maintainer: gobinath <slgobinath@gmail.com>
# Maintainer: yigits <yigit@yigitsever.com>
# Maintainer: otuva <onralpakin@gmail.com>
# Maintainer: PopeRigby <poperigby@mailbox.org>
# Maintainer: ilario <iochesonome@gmail.com>
# Maintainer: archisman <apandada1ATgmail.com>

pkgname=safeeyes
pkgver=2.2.2
pkgrel=3
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
         "python-packaging"
         "python-psutil"
         "python-xlib"
         "xorg-xprop")
makedepends=("python-setuptools" "python-packaging" "python-pip")
optdepends=("xprintidle: for Smart Pause plugin" "python-croniter: for Health Stats plugin" "wlrctl: for Do Not Disturb plugin in Wayland" "snixembed: For tray icon support in LXDE/MATE/WMs")
source=(safeeyes-$pkgver.tar.gz::"https://github.com/slgobinath/SafeEyes/archive/v$pkgver.tar.gz")
sha1sums=('e6a4d7200469a9eed11660c874558a3d50af3577')

package() {
    cd "$srcdir/SafeEyes-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
