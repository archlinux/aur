# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Archisman Panigrahi <apandada1 at gmail dot com>

_basename=typhoon

pkgname=${_basename}-bin
pkgdesc="A stylish weather app based on Stormcloud"

pkgver=1.9.3
pkgrel=1

arch=('any')
license=('GPL-3.0-or-later')
url="https://github.com/archisman-panigrahi/typhoon"

conflicts=("${_basename}")
provides=("${_basename}")

depends=('python' 'python-pyqt6' 'python-pyqt6-webengine' 'python-dbus' 'python-gobject' 'libportal' 'python-cairosvg')
makedepends=('tar')

source=("https://github.com/archisman-panigrahi/typhoon/releases/download/v${pkgver}/${_basename}_${pkgver}_all.deb")
sha256sums=('7a4fccca82411b4e24f56a0fa62d1552a0e08378f652f1c62a8a74276aa72f14')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
} 
