# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=typhoon
pkgname=${_basename}-bin
pkgver=0.9.88
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
sha256sums=('b4f9fa4fa03584e3a12f80e3692a9c0e78b0602339c8a4e92c0e0a47cb581ab8')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
} 
