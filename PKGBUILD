# Maintainer: Alain Kalker <a.c.kalker@gmail.com>
# Based on mkinitcpio-nfs-utils

pkgname=mkinitcpio-aoe
pkgver=0.4
pkgrel=1
pkgdesc="mkinitcpio hook to boot from an ATA over Ethernet (AoE) target"
arch=('i686' 'x86_64')
url="http://www.archlinux.org/"
license=('GPL2')
depends=('aoetools')
source=('initcpio-install-aoe'
        'initcpio-hook-aoe')
sha256sums=('126d70a1c6e6685d1a0b65ac003851ce5a5612812ae99aceea54a646448ca644'
            '7cb71358243feeaaffd0e11d9fa5ee2042d86f26aa26c9a081921a9e0472c942')

package() {
  install -Dm644 "$srcdir/initcpio-install-aoe" "$pkgdir/usr/lib/initcpio/install/aoe"
  install -Dm644 "$srcdir/initcpio-hook-aoe" "$pkgdir/usr/lib/initcpio/hooks/aoe"
}
