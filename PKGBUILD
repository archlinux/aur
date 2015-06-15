# Maintainer: Jenya Sovetkin <e.sovetkin@gmail.com>
pkgname=mkinitcpio-shredkeyfiles
pkgver=0.0.1
pkgrel=1
pkgdesc="mkinitcpio hook to shred keyfiles during the boot"
arch=(any)
license=('unknown')
url="https://aur.archlinux.org/packages/mkinitcpio-shredkeyfiles/"
depends=(mkinitcpio)
install="usage.install"
backup=('etc/encrypt2.conf')
source=('encrypt2.hook'
        'encrypt2.install'
        'encrypt2.conf')
md5sums=('63e87e6efeb02e56568c2c3891750100'
         '6c4f19ba9a331e5b40825f7857bb40cd'
         '50030f303d861649cfdc9f2ce7d9bb75')

package() {  
  install -Dm 644 encrypt2.hook \
     "${pkgdir}/usr/lib/initcpio/hooks/encrypt2"
  install -Dm 644 encrypt2.install \
     "${pkgdir}/usr/lib/initcpio/install/encrypt2"
  install -Dm 644 encrypt2.conf \
     "${pkgdir}/etc/encrypt2.conf"
}
