# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=3.6.1
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
         "wmctrl")
makedepends=("python-setuptools")
optdepends=("pulseaudio: mute spotify sink instead of system sound"
            "python-docopt: command-line interface")
source=("https://github.com/mikar/${pkgname}/archive/v${pkgver}.tar.gz")

package() {
    cd "$srcdir"/${pkgname}-${pkgver}

    python setup.py install --root="${pkgdir}"
}
sha256sums=('69a5f92e80c933a5afe4143e06cac579c861456ceab0b406d7ef788fe09e1f49')
