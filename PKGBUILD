# Maintainer: btc <bt4c@fm25f.lol>
pkgname=bearvpn
pkgver=1.2
pkgrel=1
pkgdesc="A fast, ephemeral VPN MANAGER for wireguard and openvpn configs."
arch=('any')
url="https://github.com/edidevv/bearvpn"
license=('MIT')
depends=('python' 'networkmanager' 'curl' 'iputils')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/edidevv/bearvpn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e1111a54c4ef5e906ca726d873300e5130117ef53ae110c8ab8ed949e29e2b2b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bearvpn "$pkgdir/usr/bin/bearvpn"
}
