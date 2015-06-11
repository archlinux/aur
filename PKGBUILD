# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=1.8.7
pkgrel=1
pkgdesc="Mutes Spotify advertisements."
arch=("any")
url="https://github.com/mikar/${pkgname}"
license=("MIT")
depends=("pygtk" "python2-wnck" "python2-dbus" "alsa-utils"
         "python2-setuptools" "gstreamer0.10-python")
optdepends=("pulseaudio" "python2-docopt")
source=("https://github.com/mikar/${pkgname}/archive/v${pkgver}.tar.gz")

package() {
    cd "$srcdir"/${pkgname}-${pkgver}

    python2 setup.py install --root="${pkgdir}"
}
sha256sums=('5b350ec4f10367360c26e99bb0fdeb368029d2d6ade0da872cc599ff75600542')
