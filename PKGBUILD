# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=usbhelper
pkgver=1.0
pkgrel=1
pkgdesc="Wii U Usb Helper"
arch=(x86_64)
url="https://github.com/FailedShack/USBHelperInstaller"
license=(GPL)
depends=(wine winetricks wget)
source=("launcher"
        "usbhelper.desktop"
        "icon.png")
sha256sums=('82384f7597d0ae52f16e6b84f29ee5cc555d9e48e769da4f83442b7ad117f465'
            '03f591cb348577d6e5bc3101d36c0047ffa809aad1b6845320cbe3f75d0fd214'
            'a057c5009c92ac25396b73b2145e3ba913105fb60cfbd9ba0e359f2df5238ab5')

package() {
  install -D -m 755 "launcher" "${pkgdir}/usr/bin/usbhelper"

  install -D -m 644 "icon.png" "${pkgdir}/usr/share/pixmaps/usbhelper.png"
  install -D -m 644 "usbhelper.desktop" "${pkgdir}/usr/share/applications/usbhelper.desktop"
}
