# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=3.3.1
pkgrel=1
pkgdesc="Mutes Spotify advertisements."
arch=("any")
url="https://github.com/mikar/${pkgname}"
license=("MIT")
conflicts=("blockify-git")
depends=("spotify" "pulseaudio" "alsa-utils" "pygtk"
         "gst-python" "python-dbus" "python-setuptools" "python-docopt")
source=("https://github.com/mikar/${pkgname}/archive/v${pkgver}.tar.gz")

package() {
    cd "$srcdir"/${pkgname}-${pkgver}

    python setup.py install --root="${pkgdir}"
}
sha256sums=('0bb4d8da4a294d3ad831726f690c9bfbcfa3f1683f56a094f39d1422495d71ab')
