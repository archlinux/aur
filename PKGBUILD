# Maintainer: PanNNN <cool.panjianhao@gmail.com>
pkgname=frame0
pkgver=1.0.0~beta.17
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
sha256sums=('3f1f2009dbaca16f3bf7a44359e46cb3dd2accd95b01cf9ed5abf81184e98087') 

package() {
    cd "${srcdir}"
    # Extract the .deb file
    ar x frame0_${pkgver}_amd64.deb 
    # Extract the data.tar.xz file
    bsdtar -xf data.tar.xz -C "${pkgdir}"
  }

