# Maintainer: PanNNN <cool.panjianhao@gmail.com>
pkgname=frame0
pkgver=1.0.0~beta.3
pkgrel=1
pkgdesc="A Balsamiq-alternative wireframming tool for modern apps"
arch=('x86_64')
url="https://frame0.app"
license=('custom')
depends=(
    "gtk3"
    "nss"
    "libnotify"
    "libxtst"
    "xdg-utils"
    "at-spi2-core"
    "libdrm"
    "mesa"
    "libxcb"
    "glib2"
)
optdepends=(
    'pulseaudio'
)
source=("https://files.frame0.app/releases/linux/x64/frame0_${pkgver}_amd64.deb")
sha256sums=('fc5f1227eaaf0257d92ef8d8275c27a1688c410962926c06b4cf25cf03a94fd3') 

package() {
    cd "${srcdir}"
    # Extract the .deb file
    ar x frame0_${pkgver}_amd64.deb 
    # Extract the data.tar.xz file
    bsdtar -xf data.tar.xz -C "${pkgdir}"
  }
