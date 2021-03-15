# Maintainer: Silvio Fricke <silvio.fricke@gmail.com>

pkgname=signal-in-tray
pkgver=1.0.0
pkgrel=1
license=('GPL3')
pkgdesc='Start signal in background via desktop files'
depends=('signal-desktop' 'xdg-utils')
makedepends=()
conflicts=()
arch=('any')
url='https://github.com/signalapp/Signal-Desktop'
source=("signal-tray.desktop")
sha512sums=('ced228d19303abe951c55f7874004cb9e4cd062dbda48c7ea80b0a6fb9adf5716a37164c01c9921a91f00653b0737fed80e3c5e684b0f3bcec375c265d6d8e5c')

package() {
  install -Dm 644 "${srcdir}"/signal-tray.desktop "${pkgdir}"/usr/share/applications/signal-tray.desktop
}
