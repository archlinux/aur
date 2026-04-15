# Maintainer: MareDevi <maredevi@maredevi.moe>
pkgname=zephyr-desktop-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Zephyr - Desktop Application"
arch=('x86_64')
url="https://github.com/MareDevi/Zephyr"
license=('GPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/zephyr_${pkgver}_amd64.deb")
sha256sums=('a886b3acf688841fb4f31428f56409091c058c1b22f539b803ab9c5b6c6789ae')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
