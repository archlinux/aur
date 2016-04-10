# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=3.6.0
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
sha256sums=('e59263a645f0943c0fd048db90781b943edcb5ba411b6224d5dc6419ec94d02c')
