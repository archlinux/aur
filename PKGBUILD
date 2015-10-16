# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=3.0.1
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
sha256sums=('57332f2567932ff91af1971dca8e8722183f24bec72c705f0b42e88feeda10da')
