# Maintainer: Youssif Al-Halawche <ymalhalawche@gmail.com>
pkgname=playport-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Wireless virtual gamepad / game controller server for Linux using uinput — stream input from Android"
arch=('x86_64')
url="https://github.com/tygrisiq/PlayPort"
license=('MIT')
depends=()
optdepends=('android-client: PlayPort Android app https://github.com/TygrisIQ/PlayPort_Client')

source=(
    "playport-${pkgver}::https://github.com/tygrisiq/PlayPort/releases/download/v${pkgver}/playport"
    "playport.1::https://github.com/tygrisiq/PlayPort/releases/download/v${pkgver}/playport.1"
  )
package(){ 
    chmod +x "${srcdir}/playport-${pkgver}"
    install -Dm755 "${srcdir}/playport-${pkgver}" "${pkgdir}/usr/bin/playport"
  }
sha256sums=('SKIP' 'SKIP')
