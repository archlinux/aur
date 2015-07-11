# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=1.8.8
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
sha256sums=('a5295bbaa17cc9680aff0aeb04d0172d37360191af7915eb5cc6ae5ee257d8b8')
