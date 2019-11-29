# Maintainer: Semyon Bochkaryov <squizduos@gmail.com>
# Previous maintainer: Koray Biçer <kbicer@pm.me>
# Contributor: Koray Biçer <kbicer@pm.me>


pkgname=icqdesktop
pkgver=10.0.7456
pkgrel=1
pkgdesc='Official ICQ desktop client for Linux (binary version)'
arch=('i686' 'x86_64')
url="https://icq.com/linux/"
license=("Apache")
depends=(
	libxcursor
	libxinerama
	libxrandr
)
conflicts=('icqdesktop-bin')
provides=('icqdesktop-bin')


# Sources
source=(
	'icq.png'
        'icq.desktop'
)
source_i686=("https://r.mail.ru/clo20842175/exe.icq.com/x32/icq.tar.xz")
source_x86_64=("https://r.mail.ru/clo20842175/exe.icq.com/x64/icq.tar.xz")
# Checksums
sha256sums=(
        '646e5bfbe01b867a6398cfd2ba49c2e3a16da2596e77fd2137f9d4e1d4ebfd7d'
        'a509978ce7e4f728b05ed316129be1d2ee55d81718cb65d5903e1e29e211241f'
)
sha256sums_i686=('cb2b318bfb0e7b24723c4143f592a8dd647de45bfd52c096f71bc4a4c379d6c9')
sha256sums_x86_64=('629b678cd970d340d25b25228c649f2c412a72ca1baa8daecc0c8d299769ce99')


package () {
    install -Dm755 icq "$pkgdir/usr/bin/icq"
    install -Dm644 icq.png "$pkgdir/usr/share/pixmaps/icq.png"
    install -Dm644 icq.desktop "$pkgdir/usr/share/applications/icq.desktop"
}
