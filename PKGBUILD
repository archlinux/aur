# Maintainer: gobinath <slgobinath@gmail.com>
# Maintainer: yigits <yigit@yigitsever.com>
# Maintainer: otuva <onralpakin@gmail.com>
# Maintainer: PopeRigby <poperigby@mailbox.org>
# Maintainer: ilario <iochesonome@gmail.com>
# Maintainer: archisman <apandada1ATgmail.com>

pkgname=safeeyes
pkgver=3.2.0
pkgrel=1
pkgdesc="A Free and Open Source tool for Linux users to reduce and prevent repetitive strain injury (RSI)."
arch=("any")
url="https://github.com/slgobinath/SafeEyes"
license=("GPL3")
depends=("libnotify"
         "gtk4"
         "python-babel"
         "python-gobject"
         "python-packaging"
         "python-psutil"
         "python-xlib")
makedepends=("python-setuptools" "python-packaging" "python-pip")
optdepends=("python-pywayland: for Smart Pause plugin in Wayland" "xprintidle: for Smart Pause plugin in X11" "ffmpeg: For playing the audible bell" "python-croniter: for Health Stats plugin" "snixembed: For tray icon support in LXDE/MATE/WMs")
source=(safeeyes-$pkgver.tar.gz::"https://github.com/slgobinath/SafeEyes/archive/v$pkgver.tar.gz")
sha1sums=('5656dc567874bd70f905d584449c7177d07eb4b3')

package() {
    cd "$srcdir/SafeEyes-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
