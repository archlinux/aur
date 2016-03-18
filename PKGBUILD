# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-netconf
pkgver=0.0.3
pkgrel=1
pkgdesc="Archlinux mkinitcpio hook for configuring early userspace networking"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-netconf"
license=('BSD')
depends=('mkinitcpio-nfs-utils' 'iproute2')
install=$pkgname.install
source=($url/archive/v$pkgver.tar.gz)
changelog='Changelog'
sha512sums=('d526ced87ef13d6a4c22c22810b0024ca51095a82a28c210fc202e73499ca8aa7a16d3f45c3c549996fbd4ed220afa15df178f93aaacfc4a547d9042f69fa760')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/netconf_hook"      "$pkgdir/usr/lib/initcpio/hooks/netconf"
  install -Dm644 "$srcdir/$pkgname-$pkgver/netconf_install"   "$pkgdir/usr/lib/initcpio/install/netconf"

}
