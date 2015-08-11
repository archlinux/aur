# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-netconf
pkgver=0.0.2
pkgrel=1
pkgdesc="Archlinux mkinitcpio hook for configuring early userspace networking"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-netconf"
license=('BSD')
depends=('mkinitcpio-nfs-utils' 'iproute2')
install=$pkgname.install
source=($url/archive/v$pkgver.tar.gz)
changelog='Changelog'
sha512sums=('d63b763dd5093ac6f18042ce3c9971c0293bc4dcf364bfb4fb33cdfafc8b4eaed705cc90148e972bf8d8e5b34e636fe854b4c8613fa5e2f7a2859fa247434951')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/netconf_hook"      "$pkgdir/usr/lib/initcpio/hooks/netconf"
  install -Dm644 "$srcdir/$pkgname-$pkgver/netconf_install"   "$pkgdir/usr/lib/initcpio/install/netconf"

}
