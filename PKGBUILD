# Maintainer: zhullyb <zhullyb@outlook.com>

pkgname=serialport-assistant-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A SerialPort Assistant written in qt"
url="https://github.com/duapple/serialport"
arch=('x86_64')
license=("Custom")
depends=('qt5-serialport' 'hicolor-icon-theme')
provides=('bash2048')
source=("https://github.com/duapple/serialport/releases/download/28686cc/serialPortAssistant"
        "serialportassistant.png"
        "serialportassistant.desktop")

md5sums=('af814714b71034e6b9e6594df1019b2e'
         'a8e30107cd6b6031d5b5599cb5c63732'
         '77220706c24d3dc0760095ee0ed64575')

package() {
  cd $srcdir
  install -Dm 755 serialPortAssistant "$pkgdir/usr/bin/SerialPortAssistant"
  install -Dm 644 serialportassistant.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/serialportassistant.png"
  install -Dm 644 serialportassistant.desktop "${pkgdir}/usr/share/applications/serialportassistant.desktop"
}
