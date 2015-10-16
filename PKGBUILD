# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=3.0.0
pkgrel=1
pkgdesc="Mutes Spotify advertisements."
arch=("any")
url="https://github.com/mikar/${pkgname}"
license=("MIT")
depends=("spotify" "pulseaudio" "alsa-utils" "wmctrl" "libwnck3" "pygtk"
         "gst-python" "python-dbus" "python-setuptools")
optdepends=("python-docopt")
source=("https://github.com/mikar/${pkgname}/archive/v${pkgver}.tar.gz")

package() {
    cd "$srcdir"/${pkgname}-${pkgver}

    python setup.py install --root="${pkgdir}"
}
sha256sums=('14273cdd5562bd87355980d6a2700fbed830033ce49012a0241d3250c833d728')
