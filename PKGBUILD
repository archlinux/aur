# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Archisman Panigrahi <apandada1 at gmail dot com>

_basename=typhoon

pkgname=${_basename}-bin
pkgdesc="A stylish weather app based on Stormcloud"

pkgver=1.9.2
pkgrel=1

arch=('any')
license=('GPL-3.0-or-later')
url="https://github.com/archisman-panigrahi/typhoon"

conflicts=("${_basename}")
provides=("${_basename}")

depends=('python' 'python-pyqt6' 'python-pyqt6-webengine' 'python-dbus' 'python-gobject' 'libportal' 'python-cairosvg')
makedepends=('tar')

source=("https://github.com/archisman-panigrahi/typhoon/releases/download/v${pkgver}/${_basename}_${pkgver}_all.deb")
sha256sums=('743ebffe7bea454081d38406f3d4a96db1efc034ac03241901920d15463a5b64')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
} 
