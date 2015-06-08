# Maintainer: Jenya Sovetkin <e.sovetkin@gmail.com>
pkgname=mkinitcpio-welcomemessage
pkgver=0.0.0
pkgrel=1
pkgdesc="mkinitcpio hook to show some message on boot"
arch=(any)
license=('unknown')
url="https://aur.archlinux.org/packages/mkinitcpio-welcomemessage/"
depends=(mkinitcpio)
install="usage.install"
backup=('etc/welcomemessage.conf')
source=('welcomemessage.hook'
        'welcomemessage.install'
        'welcomemessage.conf')
md5sums=('178136ddc22bf41020bb8d002054aea0'
         '79d4b4f282151004d6df31ac064e48f8'
         '7a08874d14bf2b7945ef638945550b83')

package() {  
  install -Dm 644 welcomemessage.hook \
     "${pkgdir}/usr/lib/initcpio/hooks/welcomemessage"
  install -Dm 644 welcomemessage.install \
     "${pkgdir}/usr/lib/initcpio/install/welcomemessage"
  install -Dm 644 welcomemessage.conf \
     "${pkgdir}/etc/welcomemessage.conf"
}
