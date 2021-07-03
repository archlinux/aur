# stolen from https://aur.archlinux.org/packages/mkinitcpio-tor/
pkgname=mkinitcpio-tor-http
pkgver=0.0.4
pkgrel=0
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



md5sums=('a4a0e5a651324b4b2632920ca103dfd0'
         'd770227ff8542316dc5529248f4dec90'
         'ccc836fedcd716ab0da09359d8b43cff'
         '224d2ffff3ce14195bf5066aa293e8dd')
