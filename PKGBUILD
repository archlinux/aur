# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=3.2.0
pkgrel=1
pkgdesc="Mutes Spotify advertisements."
arch=("any")
url="https://github.com/mikar/${pkgname}"
license=("MIT")
depends=("spotify" "pulseaudio" "alsa-utils" "pygtk"
         "gst-python" "python-dbus" "python-setuptools" "python-docopt")
source=("https://github.com/mikar/${pkgname}/archive/v${pkgver}.tar.gz")

package() {
    cd "$srcdir"/${pkgname}-${pkgver}

    python setup.py install --root="${pkgdir}"
}
sha256sums=('b1dd512d71b92820279e70ea0de4bfd88f21ae7a4e4be5961d37e232548de4e1')
