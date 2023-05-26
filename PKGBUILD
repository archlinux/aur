# Maintainer:  Novikov Maxim <the.mlex@gmail.com>

pkgname=qtwebkit-bin
pkgver=2.3.4
pkgrel=10
arch=('x86_64')
url='http://trac.webkit.org/wiki/QtWebKit'
pkgdesc='An open source web browser engine (Qt port) Bin'
license=('LGPL2.1' 'GPL3')
depends=('qt4' 'systemd' 'gst-plugins-base-libs')
makedepends=('mesa')
provides=('qtwebkit')
conflicts=('qt<4.8' 'qtwebkit')
_qtver=4.8.7
source=("https://download.sourceforge.net/project/arch-mod/aur-pkgs/qtwebkit-${pkgver}-9-x86_64.pkg.tar.zst")
sha256sums=('41549fcdd0fd3a9ab89833ab2b81e7d1e973c8d38ca601be0f1238b1adeae54f')

package() {
 install -d -m755 "$pkgdir"/usr/
 cp -a ${srcdir}/usr/ $pkgdir/
}
