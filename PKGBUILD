pkgname=brcmfmac-suspend
pkgver=1.0
pkgrel=2
pkgdesc="Systemd service to unload/reload brcmfmac for reliable suspend (Broadcom WiFi workaround)"
arch=('any')
url="https://wiki.archlinux.org/title/Broadcom_wireless"
license=('MIT')
depends=('networkmanager')
source=("$pkgname.service")
sha256sums=('e7028245b6c7fad03738fa116cf7e83b8dd5db838198dd9553447c50b9276b50')
install=$pkgname.install

package() {
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

