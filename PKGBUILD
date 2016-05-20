# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=3.6.3
pkgrel=1
pkgdesc="Mutes Spotify advertisements."
arch=("any")
url="https://github.com/mikar/${pkgname}"
license=("MIT")
conflicts=("blockify-git")
depends=("spotify"
         "alsa-utils"
         "pygtk"
         "gst-python"
         "python-dbus"
         "python-docopt"
         "wmctrl")
makedepends=("python-setuptools")
optdepends=("pulseaudio: mute spotify sink instead of system sound")
source=("https://github.com/mikar/${pkgname}/archive/v${pkgver}.tar.gz")

package() {
    cd "$srcdir"/${pkgname}-${pkgver}

    python3 setup.py install --root="${pkgdir}"
}
sha256sums=('8560d524841810dded866e27655553a6850438145bfc73184bd9423e8826c309')
