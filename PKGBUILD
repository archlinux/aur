# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=typhoon
pkgname=${_basename}-bin
pkgver=0.9.92
pkgrel=1
pkgdesc="A stylish weather app based on Stormcloud"
arch=('any')
url="https://github.com/archisman-panigrahi/typhoon"
license=('GPL-3.0-or-later')
conflicts=("${_basename}")
provides=("${_basename}")
depends=('gtk3' 'webkit2gtk' 'python' 'python-dbus' 'python-gobject' 'bash' 'gdk-pixbuf2' 'webkit2gtk' 'imagemagick')
makedepends=('tar')
source=("https://github.com/archisman-panigrahi/typhoon/releases/download/v${pkgver}/${_basename}_${pkgver}_all.deb")
sha256sums=('e122e61936ef9746b5b0b7d1425fe5757b54408b51b6b66568b4324ef521efcc')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
} 
