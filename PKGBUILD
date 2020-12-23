# Maintainer: MailRu-im

pkgname=icq-bin
pkgver=10.0.12269
pkgrel=1
pkgdesc='Official icq desktop client for Arch Linux'
arch=('x86_64')
url=https://icq.com/
license=("Apache")
depends=(
        libxcursor
        libxinerama
        libxrandr
)
conflicts=('icqdesktop-bin' 'icqdesktop-git' 'icqdesktop')
provides=('icq')


source=(
        'https://hb.bizmrg.com/icq-www/linux/x64/packages/10.0.12269/icq-10.0.12269_64bit.tar.xz'
        'icq.png::https://hb.bizmrg.com/icq-www/linux/x64/packages/10.0.12269/icq.png'
        'icq.desktop'
)

sha256sums=(
        '01e77f93c1657d490205f21fa393aa08bfa5f78569929582687d968b871c7337'
        'd41101994702521210a99ca95e25cba3a8fbf9ff59c1f78a4bc834f0086b3941'
        '78cb66363a5e01299f1552ecb55688965ec5596de25314e10df97fa88aee605f'
)


package () {
    install -Dm755 icq "$pkgdir/usr/bin/icq"
    install -Dm644 icq.png "$pkgdir/usr/share/pixmaps/icq.png"
    install -Dm644 icq.desktop "$pkgdir/usr/share/applications/icq.desktop"
}
