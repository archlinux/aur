# Maintainer: Senderman <doletov.fyodor@yandex.ru>

pkgname=pulseaudio-smdev-reload
pkgdesc="Reload pulseaudio devices on smdev systems"
pkgver=1.1
pkgrel=1
arch=('any')
url="https://aur.archlinux.org/packages/$pkgname"
depends=('smdev' 'pulseaudio')
license=('Apache')
source=('40-pulse' 'pulseaudio-smdev-reload')
md5sums=('33f4fb31e32e8c3a49ac964f76709a47'
         'dbca69cd991f2de7e826b5ae1a9afd07')


package() {
    install -Dm0644 $srcdir/40-pulse $pkgdir/etc/smdev/add/40-pulse
    install -Dm0644 $srcdir/40-pulse $pkgdir/etc/smdev/remove/40-pulse
    install -Dm0755 $srcdir/pulseaudio-smdev-reload $pkgdir/usr/bin/pulseaudio-smdev-reload
    msg ''
    msg ''
    msg '==============================================='
    msg ' Add this line to your .xinitrc or .xprofile:'
    msg ' pulseaudio-smdev-reload &' 
    msg '==============================================='
    msg ''
    msg ''
}
