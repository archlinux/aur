# Maintainer: Silvio Fricke <silvio.fricke@gmail.com>

pkgname=signal-in-tray
pkgver=1.0.0
pkgrel=2
license=('GPL3')
pkgdesc='Start signal in background via desktop files'
depends=('signal-desktop' 'xdg-utils')
makedepends=()
conflicts=()
arch=('any')
url='https://github.com/signalapp/Signal-Desktop'
source=("signal-tray.desktop")
sha512sums=('d7b95a741ad1f347e3c22c884e4e78a7a1e6830e5f748a49e5f49d03a3e78faeb61894ff9c41f4d8f3822f8e8bd3430fddda6bf22f103316bdb2faf6dad8c237')

package() {
  install -Dm 644 "${srcdir}"/signal-tray.desktop "${pkgdir}"/usr/share/applications/signal-tray.desktop
}
