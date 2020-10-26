# stolen from https://aur.archlinux.org/packages/mkinitcpio-tor/
pkgname=mkinitcpio-tor-http
pkgver=0.0.1
pkgrel=1
pkgdesc="Arch Linux mkinitcpio hook for running tor on the initramfs and requesting decryption keys"
arch=('any')
license=('BSD')
depends=('tor' 'mkinitcpio-netconf' 'jq')
source=('torhttp_hook' 'torhttp_install' 'torrc' 'config.sh')

package() {
  install -Dm644 "$srcdir/torhttp_hook"      "$pkgdir/usr/lib/initcpio/hooks/torhttp"
  install -Dm644 "$srcdir/torhttp_install"   "$pkgdir/usr/lib/initcpio/install/torhttp"
  install -Dm644 "$srcdir/torrc"   "$pkgdir/usr/share/$pkgname/torrc"
  install -Dm644 "$srcdir/config.sh"   "$pkgdir/usr/share/$pkgname/config.sh"
}



md5sums=('4c9e7d637403b2848906bf44ba32cbfd'
         '381258176f933d21e0fd7249920d4763'
         'fa551b003e0c8f908a5c3d4aa9bfb706'
         'bf6e7349c35f873d59a5e2d198a804fb')
