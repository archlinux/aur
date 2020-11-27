# Maintainer: MailRu-im

pkgname=icq-bin
pkgver=10.0.11919
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
        'https://hb.bizmrg.com/icq-www/linux/x64/packages/10.0.11919/icq-10.0.11919_64bit.tar.xz'
        'icq.png::https://raw.githubusercontent.com/mail-ru-im/im-desktop/c3f62282df03a8d5ffb84fec192052a9a1bb963a/gui/resources/main_window/logo_small_200.png'
        'icq.desktop'
)

sha256sums=(
        '0135bf0c79a25c476a137370670f3bbee31738ba439c326d606305030ad5e7c2'
        '646e5bfbe01b867a6398cfd2ba49c2e3a16da2596e77fd2137f9d4e1d4ebfd7d'
        '78cb66363a5e01299f1552ecb55688965ec5596de25314e10df97fa88aee605f'
)


package () {
    install -Dm755 icq "$pkgdir/usr/bin/icq"
    install -Dm644 icq.png "$pkgdir/usr/share/pixmaps/icq.png"
    install -Dm644 icq.desktop "$pkgdir/usr/share/applications/icq.desktop"
}
