# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=1.9.0
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
sha256sums=('48ad32beaa388550ca27d5d60c5e1f4ceb2351a7ea1cb7aef11750ab7d7666d0')
