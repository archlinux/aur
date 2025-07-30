# Maintainer: Anuvind A P <anuvindap2016@gmail.com>
pkgname=bluesync
pkgver=1.0
pkgrel=1
pkgdesc="Sync Bluetooth LinkKey from Windows registry and apply it in Linux"
arch=('any')
url="https://github.com/Anuvind-ap/bluesync"
license=('GPL3')
depends=('bash' 'ntfs-3g' 'chntpw')
optdepends=(
  'bluez: to restart Bluetooth and manage devices'
)
source=("bluesync")
sha256sums=('SKIP')  # Optionally replace 'SKIP' with actual checksum for reproducibility

package() {
  install -Dm755 "$srcdir/bluesync" "$pkgdir/usr/bin/bluesync"
}
