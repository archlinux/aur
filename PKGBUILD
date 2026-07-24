# Maintainer: DBeidachazi
pkgname=wireplumber-lhdc-config
pkgver=0.1.2
pkgrel=1
pkgdesc="WirePlumber configuration for PipeWire LHDC v5 Bluetooth playback"
arch=('any')
url="https://github.com/DBeidachazi/pipewire-lhdc-aur/tree/master/wireplumber-lhdc-config"
license=('MIT')
depends=('wireplumber' 'pipewire-bluez5-lhdc-git')
install="$pkgname.install"
source=(
  '50-lhdc.conf'
)
sha256sums=(
  'SKIP'
)

package() {
  install -Dm644 50-lhdc.conf \
    "$pkgdir/usr/lib/systemd/user/wireplumber.service.d/50-lhdc.conf"
}
