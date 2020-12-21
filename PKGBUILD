# Maintainer: MailRu-im

pkgname=icq-bin
pkgver=10.0.12171
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
        'https://hb.bizmrg.com/icq-www/linux/x64/packages/10.0.12171/icq-10.0.12171_64bit.tar.xz'
        'icq.png::https://hb.bizmrg.com/icq-www/linux/x64/packages/10.0.12171/icq.png'
        'icq.desktop'
)

sha256sums=(
        'c98188ce1d032b3f8b5025e5fd189faac3875dfe5cc11815d4bf852bfd668936'
        'd41101994702521210a99ca95e25cba3a8fbf9ff59c1f78a4bc834f0086b3941'
        '78cb66363a5e01299f1552ecb55688965ec5596de25314e10df97fa88aee605f'
)


package () {
    install -Dm755 icq "$pkgdir/usr/bin/icq"
    install -Dm644 icq.png "$pkgdir/usr/share/pixmaps/icq.png"
    install -Dm644 icq.desktop "$pkgdir/usr/share/applications/icq.desktop"
}
