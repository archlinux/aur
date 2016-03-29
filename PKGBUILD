# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=blockify
pkgver=3.4.0
pkgrel=1
pkgdesc="Mutes Spotify advertisements."
arch=("any")
url="https://github.com/mikar/${pkgname}"
license=("MIT")
conflicts=("blockify-git")
depends=("spotify"
         "alsa-utils" 
         "pygtk" 
         "gst-python" 
         "python-dbus")
makedepends=("python-setuptools")
optdepends=("pulseaudio: mute spotify sink instead of system sound"
            "python-docopt: command-line interface")
source=("https://github.com/mikar/${pkgname}/archive/v${pkgver}.tar.gz")

package() {
    cd "$srcdir"/${pkgname}-${pkgver}

    python setup.py install --root="${pkgdir}"
}
sha256sums=('56b625d1050a5c19262e2b772dbf36ad28ca6feab1fe2af36529f74d14b93bab')
