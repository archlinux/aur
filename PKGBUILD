# Maintainer: MailRu-im

pkgname=myteam-bin
pkgver=10.0.5258
pkgrel=1
pkgdesc='Official myteam desktop client for Arch Linux'
arch=('x86_64')
url=https://biz.mail.ru/myteam/
license=("Apache")
depends=(
        libxcursor
        libxinerama
        libxrandr
)
conflicts=('icqdesktop-bin' 'icqdesktop-git' 'icqdesktop')
provides=('myteam')


source=(
        'https://hb.bizmrg.com/myteam-www/linux/x64/packages/10.0.5258/myteam-10.0.5258_64bit.tar.xz'
        'myteam.png::https://hb.bizmrg.com/myteam-www/linux/x64/packages/10.0.5258/myteam.png'
        'myteam.desktop'
)

sha256sums=(
        'ee0b391e6e1adc4a637ef4e27203e4d1979e90bc7494e25f52ababed6ed51164'
        'ff682fa380d11e60969576467fe22ae101498ef1d402ffa6482e14204afbf83c'
        '7c3f43d2ecb3c3f340a5f54e71f6c101c38b5f0d45c224c0240cdd6bda19dc9d'
)


package () {
    install -Dm755 myteam "$pkgdir/usr/bin/myteam"
    install -Dm644 myteam.png "$pkgdir/usr/share/pixmaps/myteam.png"
    install -Dm644 myteam.desktop "$pkgdir/usr/share/applications/myteam.desktop"
}
