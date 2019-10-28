# Maintainer: Semyon Bochkaryov <squizduos@gmail.com>
# Previous maintainer: Koray Biçer <kbicer@pm.me>
# Contributor: Koray Biçer <kbicer@pm.me>


pkgname=icqdesktop
pkgver=10.0.6611
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
        '6f67421a78c5ea09af1e05b713a9d468fe1e2bda73e4fd20d7ec54c3184f2676'
)
sha256sums_i686=('ca81e2a16a17f6655a498271529279f835ab15b2574381359d70a8e911ba0a4f')
sha256sums_x86_64=('4cc647aa8c2158b379acb2074ba577d2e13e58a5965521589408e764ffb71afa')
# Some installation information

package () {
    install -Dm755 icq "$pkgdir/usr/bin/icq"
    install -Dm644 icq.png "$pkgdir/usr/share/pixmaps/icq.png"
    install -Dm644 icq.desktop "$pkgdir/usr/share/applications/icq.desktop"
}
