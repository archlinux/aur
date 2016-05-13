# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=3.6.2
pkgrel=2
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
sha256sums=('2f8e3adddc1a17d448e1a6d6f5c02b455f1e68f69af2681b60076231231fd035')
