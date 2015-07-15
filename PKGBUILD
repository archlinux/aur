# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-netconf
pkgver=0.0.1
pkgrel=1
pkgdesc="Archlinux mkinitcpio hook for configuring early userspace networking"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-netconf"
license=('BSD')
depends=('mkinitcpio-nfs-utils' 'iproute2')
install=$pkgname.install
source=($url/archive/v$pkgver.tar.gz)
changelog='Changelog'
sha512sums=('86a79da8994b79df34407744400a5fc125e984e7550068e176d98e1c348e3c0bed78f21e901a215c10de6eb65beac53cfdb17ee73014a7ab38ac09ce937c634c')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/netconf_hook"      "$pkgdir/usr/lib/initcpio/hooks/netconf"
  install -Dm644 "$srcdir/$pkgname-$pkgver/netconf_install"   "$pkgdir/usr/lib/initcpio/install/netconf"

}
