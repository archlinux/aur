# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=typhoon
pkgname=${_basename}-bin
pkgver=0.9.7
pkgrel=2
pkgdesc="A stylish weather app based on Stormcloud"
arch=('x86_64')
url="https://github.com/archisman-panigrahi/typhoon"
license=('GPL-3.0-or-later')
conflicts=("${_basename}")
provides=("${_basename}")
depends=('gtk3' 'webkit2gtk' 'python' 'python-dbus' 'python-gobject' 'bash' 'gdk-pixbuf2' 'webkit2gtk' 'imagemagick')
makedepends=('tar')
source_x86_64=("https://github.com/archisman-panigrahi/typhoon/releases/download/v${pkgver}1/${_basename}_${pkgver}1_all.deb")
sha256sums_x86_64=('875c090d513ebc14ca17e23461ac2a159c52cd6ce6e355483d4a769abed9db81')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
} 
