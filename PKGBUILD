# Maintainer: MailRu-im

pkgname=myteam-bin
pkgver=10.0.5203
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
        'https://hb.bizmrg.com/myteam-www/linux/x64/packages/10.0.5203/myteam-10.0.5203_64bit.tar.xz'
        'myteam.png::https://hb.bizmrg.com/myteam-www/linux/x64/packages/10.0.5203/myteam.png
        'myteam.desktop'
)

sha256sums=(
        '25bbfa3219aa31686b19f50aa0e002f0ebf7e9c93a3be905d27fdb80f1eab796'
        ''
        '7c3f43d2ecb3c3f340a5f54e71f6c101c38b5f0d45c224c0240cdd6bda19dc9d'
)


package () {
    install -Dm755 myteam "$pkgdir/usr/bin/myteam"
    install -Dm644 myteam.png "$pkgdir/usr/share/pixmaps/myteam.png"
    install -Dm644 myteam.desktop "$pkgdir/usr/share/applications/myteam.desktop"
}
