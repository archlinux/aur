# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=usbhelper
pkgver=1.1
pkgrel=3
pkgdesc="Wii U Usb Helper"
arch=(x86_64)
url="https://github.com/FailedShack/USBHelperInstaller"
license=(GPL)
depends=(wine winetricks wget)
source=("launcher"
        "usbhelper.desktop"
        "icon.png")
sha256sums=('f1e7066690c9a2beae181493ab97368264d1ff181e7b3055f8ef4f23dda04b36'
            '03f591cb348577d6e5bc3101d36c0047ffa809aad1b6845320cbe3f75d0fd214'
            'a057c5009c92ac25396b73b2145e3ba913105fb60cfbd9ba0e359f2df5238ab5')

package() {
  install -D -m 755 "launcher" "${pkgdir}/usr/bin/usbhelper"

  install -D -m 644 "icon.png" "${pkgdir}/usr/share/pixmaps/usbhelper.png"
  install -D -m 644 "usbhelper.desktop" "${pkgdir}/usr/share/applications/usbhelper.desktop"
}
