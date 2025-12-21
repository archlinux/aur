# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=typhoon

pkgname=${_basename}-bin
pkgdesc="A stylish weather app based on Stormcloud"

pkgver=1.3.2
pkgrel=1

arch=('any')
license=('GPL-3.0-or-later')
url="https://github.com/archisman-panigrahi/typhoon"

conflicts=("${_basename}")
provides=("${_basename}")

depends=('gtk3' 'webkit2gtk' 'python' 'python-dbus' 'python-gobject' 'python-cairosvg' 'bash' 'gdk-pixbuf2' 'webkit2gtk' 'imagemagick' 'libportal')
makedepends=('tar')

source=("https://github.com/archisman-panigrahi/typhoon/releases/download/v${pkgver}/${_basename}_${pkgver}_all.deb")
sha256sums=('5ad1a9fb83905c7464c13784ba1b45bf8e81529d4213b704983e82aec8fab5fe')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
} 
