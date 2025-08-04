pkgname=brcmfmac-suspend
pkgver=1.0
pkgrel=1
pkgdesc="Systemd service to unload/reload brcmfmac for reliable suspend (Broadcom WiFi workaround)"
arch=('any')
url="https://wiki.archlinux.org/title/Broadcom_wireless"
license=('MIT')
depends=('networkmanager')
optdepends=('linux-firmware: required firmware for brcmfmac')
source=("$pkgname.service")
sha256sums=('SKIP') # replace with real hash 
install=$pkgname.install

package() {
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

