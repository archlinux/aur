# Maintainer: Silvio Fricke <silvio.fricke@gmail.com>

pkgname=signal-in-tray
pkgver=1.0.0
pkgrel=3
license=('GPL3')
pkgdesc='Start signal in background via desktop files'
depends=('signal-desktop' 'xdg-utils')
makedepends=()
conflicts=()
arch=('any')
url='https://github.com/signalapp/Signal-Desktop'
source=("signal-tray.desktop")
sha512sums=('7aac1481b42dc3930d99d192cae8b04f60426f14e73561fe90881eb36c2467491d3fb5bc3c4067f38bf73e13707e90c65f2a57c4524802aad7f92d5d37b1d3b1')

package() {
  install -Dm 644 "${srcdir}"/signal-tray.desktop "${pkgdir}"/usr/share/applications/signal-tray.desktop
}
