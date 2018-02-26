pkgname=icqdesktop-bin
pkgver=10.0
pkgrel=1
pkgdesc='Official ICQ client for Linux (binary version)'
arch=('x86_64')
url="https://icq.com/linux/"
license=("Apache")
depends=('libxcursor' 'libxinerama' 'libxrandr')
source=('https://r.mail.ru/clo20842175/exe.icq.com/x64/icq.tar.xz'
        'icq.png::https://raw.githubusercontent.com/mailru/icqdesktop/master/gui/resources/main_window/logo_200.png'
        'icq.desktop')
sha256sums=('SKIP'
            '892b6553c9a9319d75682fe762ed56ea0ea956f8d60d74a07879de44a18735d3'
            '6f67421a78c5ea09af1e05b713a9d468fe1e2bda73e4fd20d7ec54c3184f2676')

package () {
    install -Dm755 icq "$pkgdir/usr/bin/icq"
    install -Dm644 icq.png "$pkgdir/usr/share/pixmaps/icq.png"
    install -Dm644 icq.desktop "$pkgdir/usr/share/applications/icq.desktop"
}
