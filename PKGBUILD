pkgname=icqdesktop-bin
pkgver=10.0.9932
pkgrel=1
pkgdesc='Official ICQ client for Linux (binary version)'
arch=('x86_64')
url="https://icq.com/linux/"
license=("Apache")
depends=('libxcursor' 'libxinerama' 'libxrandr')
source=('https://hb.bizmrg.com/icq-www/linux/x64/icq.tar.xz'
        'icq.png::https://raw.githubusercontent.com/mail-ru-im/im-desktop/c3f62282df03a8d5ffb84fec192052a9a1bb963a/gui/resources/main_window/logo_small_200.png'
        'icq.desktop')
sha256sums=('7098e4e506a2b29573b11099c5ad81d156ca6aed9910a7ea6909d324aa5b8244'
            '646e5bfbe01b867a6398cfd2ba49c2e3a16da2596e77fd2137f9d4e1d4ebfd7d'
            '6f67421a78c5ea09af1e05b713a9d468fe1e2bda73e4fd20d7ec54c3184f2676')

package () {
    install -Dm755 icq "$pkgdir/usr/bin/icq"
    install -Dm644 icq.png "$pkgdir/usr/share/pixmaps/icq.png"
    install -Dm644 icq.desktop "$pkgdir/usr/share/applications/icq.desktop"
}
