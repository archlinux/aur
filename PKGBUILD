# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=typhoon
pkgname=${_basename}-bin
pkgver=0.9.94
pkgrel=2
pkgdesc="A stylish weather app based on Stormcloud"
arch=('any')
url="https://github.com/archisman-panigrahi/typhoon"
license=('GPL-3.0-or-later')
conflicts=("${_basename}")
provides=("${_basename}")
depends=('gtk3' 'webkit2gtk' 'python' 'python-dbus' 'python-gobject' 'python-cairosvg' 'bash' 'gdk-pixbuf2' 'webkit2gtk' 'imagemagick' 'libportal')
makedepends=('tar')
source=("https://github.com/archisman-panigrahi/typhoon/releases/download/v${pkgver}/${_basename}_${pkgver}_all.deb")
sha256sums=('547a8891444fec612a402a28d529e0def2aac1d3f081e474ec7271d0663dd9e5')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
} 
