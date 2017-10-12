# Maintainer: Yamakaky <yamakaky@yamaworld_fr>
pkgname=safeeyes
pkgver=2.0.0
pkgrel=1
pkgdesc="A Linux alternative for EyeLeo"
arch=("any")
url="https://github.com/slgobinath/SafeEyes"
license=("GPL3")
depends=("python"
         "hicolor-icon-theme"
         "libappindicator-gtk3"
         "python-xlib"
         "python-psutil"
         "python-babel"
         "python-dbus"
         "alsa-utils"
         "xorg-xprop"
         "xprintidle")
source=(safeeyes-$pkgver.tar.gz::"https://github.com/slgobinath/SafeEyes/archive/v$pkgver.tar.gz")
sha1sums=('3e5e0d848ca70a16c0534861d75ed63afdf4f6f7')

package() {
    cd "$srcdir/SafeEyes-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
