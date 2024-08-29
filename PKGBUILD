#Maintainer: fl4co <fl4co at fl4co dot net>

pkgname=winbox-beta-bin
pkgver=4.0beta1
pkgrel=1
pkgdesc="Configuration tool for MikroTik RouterOS (native beta version)"
url="https://forum.mikrotik.com/viewtopic.php?t=210505"
arch=('x86_64')
license=('custom')
options=(!debug)
source=("https://download.mikrotik.com/routeros/winbox/${pkgver}/WinBox_Linux.zip"
        "winbox-beta.desktop")
sha256sums=('7be43fd331fc60b30d54ebb7fd0be89dab793c7e1be15d9ae43361b7d6418092'
            '9416467272ef32b5f2b15292ef4752933034173b6a9a0ac00ff10730fd4e949a')

package() {
  install -Dm755 "${srcdir}/WinBox" "${pkgdir}/usr/bin/winbox-beta"
  install -Dm644 "${srcdir}/assets/img/winbox.png" "${pkgdir}/usr/share/pixmaps/winbox-beta.png"
  install -Dm644 "${srcdir}/winbox-beta.desktop" "${pkgdir}/usr/share/applications/winbox-beta.desktop"
}
