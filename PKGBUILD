# Maintainer:  Novikov Maxim <the.mlex@gmail.com>

pkgname=qtwebkit-bin
pkgver=2.3.4
pkgrel=8
arch=('x86_64')
url='http://trac.webkit.org/wiki/QtWebKit'
pkgdesc='An open source web browser engine (Qt port) Bin'
license=('LGPL2.1' 'GPL3')
depends=('qt4' 'systemd' 'gst-plugins-base-libs')
makedepends=('mesa')
provides=('qtwebkit')
conflicts=('qt<4.8' 'qtwebkit')
_qtver=4.8.7
source=("https://download.sourceforge.net/project/arch-mod/aur-pkgs/qtwebkit-${pkgver}-6-x86_64.pkg.tar.xz")
sha256sums=('466e923363234858d30c1e4bbac10c2003719d2350f48ec36b0632ab3f6274b2')

package() {
 install -d -m755 "$pkgdir"/usr/
 cp -a ${srcdir}/usr/ $pkgdir/
}
