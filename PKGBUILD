# Maintainer: Dominik "Zatherz" Banaszak <zatherz@linux.pl>

pkgname=lxqt-qt5ct
pkgver=1.0
pkgrel=3
pkgdesc="LXQt Qt5ct integration"
url="https://gitlab.com/Zatherz/lxqt-qt5ct"

arch=('i686' 'x86_64')
license=('LGPL2.1')

depends=('lxqt-session' "qt5ct")

provides=('lxqt-qt5ct')
conflicts=('startlxqt-qt5ct')

source=("https://gitlab.com/Zatherz/lxqt-qt5ct/repository/archive.tar.gz?ref=1.0")

md5sums=('4685ac0ff9f5df43b54d3928444a3a14')


package() {
  cd "$srcdir"/"${pkgname}-${pkgver}-b8c8b963d0cdcd5a0dedfa98239f43c2a4e84fb6"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/xsessions"

  install -Dm755 "startlxqt-qt5ct" "$pkgdir/usr/bin/"
  install -Dm644 "lxqt-qt5ct.desktop" "$pkgdir/usr/share/xsessions/"
}

