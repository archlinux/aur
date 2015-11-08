# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=3.0.2
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
sha256sums=('78624514320481a6dd07c0202dfd79f057156b2f4adba2d7d7a4273db44d793a')
