# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

pkgname=t200ta-wifi
pkgver=r1
pkgrel=1
pkgdesc="Wi-Fi lib for ASUS T200TA (and possibly other Bay Trail devices)"
arch=('any')
url="https://github.com/DX37/T200TA"
license=('GPL')
optdepends=('networkmanager: awesome internet connections manager'
            'network-manager-applet: GUI and tray icon for networkmanager')
install=$pkgname.install
source=("brcmfmac43340-sdio.txt")
md5sums=('fd635836716e71a543b2c134d01e0613')

package() {
    # Just installing needed file
    install -Dm644 brcmfmac43340-sdio.txt "$pkgdir"/usr/lib/firmware/brcm/brcmfmac43340-sdio.txt
}
