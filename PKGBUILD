# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=3.2.1
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
sha256sums=('d64d611603a5116bca1736953888b336784720d6071603420c41f7a57cb6e441')
