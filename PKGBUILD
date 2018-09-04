# Maintainer:  Novikov Maxim <the.mlex@gmail.com>

pkgname=qtwebkit-bin
pkgver=2.3.4
pkgrel=9
arch=('x86_64')
url='http://trac.webkit.org/wiki/QtWebKit'
pkgdesc='An open source web browser engine (Qt port) Bin'
license=('LGPL2.1' 'GPL3')
depends=('qt4' 'systemd' 'gst-plugins-base-libs')
makedepends=('mesa')
provides=('qtwebkit')
conflicts=('qt<4.8' 'qtwebkit')
_qtver=4.8.7
source=("https://download.sourceforge.net/project/arch-mod/aur-pkgs/qtwebkit-${pkgver}-7-x86_64.pkg.tar.xz")
sha256sums=('924f615daf77cc4e6fa19701d32a5f2b6bc8d4fa966e27e508809dce2d77d6c8')

package() {
 install -d -m755 "$pkgdir"/usr/
 cp -a ${srcdir}/usr/ $pkgdir/
}
