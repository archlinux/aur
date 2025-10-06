# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=typhoon
pkgname=${_basename}-bin
pkgver=1.2
pkgrel=1
pkgdesc="A stylish weather app based on Stormcloud"
arch=('any')
url="https://github.com/archisman-panigrahi/typhoon"
license=('GPL-3.0-or-later')
conflicts=("${_basename}")
provides=("${_basename}")
depends=('gtk3' 'webkit2gtk' 'python' 'python-dbus' 'python-gobject' 'python-cairosvg' 'bash' 'gdk-pixbuf2' 'webkit2gtk' 'imagemagick' 'libportal')
makedepends=('tar')
source=("https://github.com/archisman-panigrahi/typhoon/releases/download/v${pkgver}/${_basename}_${pkgver}_all.deb")
sha256sums=('f9a6d5e323bcfdb2ec38be4bab4fe4aa85ac99b13f9668f3ee1880c45f73053c')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
} 
