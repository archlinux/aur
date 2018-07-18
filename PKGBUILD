# Maintainer: Nick Webster <nick@nick.geek.nz>
pkgname=micropad
pkgver=3.8.1
pkgrel=1
pkgdesc="A powerful notepad app that respects your freedoms and runs on everything."
arch=('x86_64')
url="https://getmicropad.com"
license=('MPL2')
depends=('c-ares'
         'gconf'
         'gtk3'
         'http-parser'
         'libevent'
         'libvpx'
         'libxslt'
         'libxss'
         'minizip'
         'nss'
         're2'
         'snappy')
source=("https://github.com/MicroPad/Electron/releases/download/v${pkgver}/${pkgname}-${pkgver}.pacman")
md5sums=('03c96d2eff6c1dc44cfc6efd67499cef')
install="micropad.install"

package() {
  mv opt "${pkgdir}/opt"
  mv usr "${pkgdir}/usr"
}
