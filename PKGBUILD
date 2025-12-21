# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=typhoon

pkgname=${_basename}-bin
pkgdesc="A stylish weather app based on Stormcloud"

pkgver=1.3.3
pkgrel=1

arch=('any')
license=('GPL-3.0-or-later')
url="https://github.com/archisman-panigrahi/typhoon"

conflicts=("${_basename}")
provides=("${_basename}")

depends=('gtk3' 'webkit2gtk' 'python' 'python-dbus' 'python-gobject' 'python-cairosvg' 'bash' 'gdk-pixbuf2' 'webkit2gtk' 'imagemagick' 'libportal')
makedepends=('tar')

source=("https://github.com/archisman-panigrahi/typhoon/releases/download/v${pkgver}/${_basename}_${pkgver}_all.deb")
sha256sums=('sha256:74c022a86cf728aaea95b6d7f7d6f44b229a3146a537ad819b0d9cb7e1eefb48')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
} 
