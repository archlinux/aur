# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=3.3.0
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
sha256sums=('e71d224f3f278c8d674f03f49d90079c3921b8c63914aba9c4ddbf738f3738c8')
