# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=typhoon
pkgname=${_basename}-bin
pkgver=0.9.8
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
sha256sums_x86_64=('a4a6e7877f27a81e6f63ea829c463c6bd2e3cfbb39c7057c3955ae8d14c830d5')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
} 
