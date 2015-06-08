# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=hypervc-qt4
pkgver=0.4.1
pkgrel=3
pkgdesc="Qt frontend for various command line tools such as ffmpeg or mencoder"
arch=(i686 x86_64)
url="http://www.kde-apps.org/content/show.php/Hyper+Video+Converter?content=67781"
license=('GPL')
depends=('qt4')
optdepends=('ffmpeg' 'ffmpeg2theora' 'mplayer')
conflicts=('hypervideoconverter')
install=$pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/hypervideoconve/hypervc-${pkgver}-qt4-generic.tar.bz2)
md5sums=('7a1048363d3a0462fd7c35e86834df69')

build() {
  cd "${srcdir}/hypervcinstall-qt4"

  install -v -D -m 0755 hypervc ${pkgdir}/usr/bin/hypervc
  install -v -D -m 0755 libqt4intf.so ${pkgdir}/usr/lib/libqt4intf.so
  install -v -D -m 0644 hypervclogo.png ${pkgdir}/usr/share/icons/hypervclogo.png
  install -v -D -m 0644 hyper.desktop ${pkgdir}/usr/share/applications/hyper.desktop
  install -v -D -m 0644 .hyperconf ${pkgdir}/usr/share/${pkgname}/hyperconf
}

# vim:set ts=2 sw=2 et:
