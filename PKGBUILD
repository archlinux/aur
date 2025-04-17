# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=typhoon
pkgname=${_basename}-bin
pkgver=0.9.80
pkgrel=1
pkgdesc="A stylish weather app based on Stormcloud"
arch=('x86_64')
url="https://github.com/archisman-panigrahi/typhoon"
license=('GPL-3.0-or-later')
conflicts=("${_basename}")
provides=("${_basename}")
depends=('gtk3' 'webkit2gtk' 'python' 'python-dbus' 'python-gobject' 'bash' 'gdk-pixbuf2' 'webkit2gtk' 'imagemagick')
makedepends=('tar')
source_x86_64=("https://github.com/archisman-panigrahi/typhoon/releases/download/v${pkgver}/${_basename}_${pkgver}_all.deb")
sha256sums_x86_64=('67f5ea85341b8a9c6f2f48f65e1dfe8c8921090146e044fcdbdfb994bac8244d')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
} 
