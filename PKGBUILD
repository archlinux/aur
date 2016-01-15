# Maintainer: Dominik "Zatherz" Banaszak <zatherz@linux.pl>

pkgname=lxqt-qt5ct
pkgver=1.0
pkgrel=2
pkgdesc="LXQt Qt5ct integration"
url="https://github.com/Zatherz/lxqt-qt5ct"

arch=('i686' 'x86_64')
license=('LGPL2.1')

depends=('lxqt-session' "qt5ct")

provides=('lxqt-qt5ct')
conflicts=('startlxqt-qt5ct')

source=("https://github.com/zatherz/lxqt-qt5ct/archive/1.0.tar.gz")

md5sums=('8963e38fa81faf869fcaee968210f00d')


package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/xsessions"

  install -Dm755 "startlxqt-qt5ct" "$pkgdir/usr/bin/"
  install -Dm644 "lxqt-qt5ct.desktop" "$pkgdir/usr/share/xsessions/"
}

