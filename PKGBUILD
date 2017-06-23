# Maintainer:  Novikov Maxim <the.mlex@gmail.com>

pkgname=qtwebkit-bin
pkgver=2.3.4
pkgrel=5
arch=('x86_64')
url='http://trac.webkit.org/wiki/QtWebKit'
pkgdesc='An open source web browser engine (Qt port) Bin'
license=('LGPL2.1' 'GPL3')
depends=('qt4' 'systemd' 'gst-plugins-base-libs')
makedepends=('mesa')
conflicts=('qt<4.8')
_qtver=4.8.7
source=("https://download.sourceforge.net/project/arch-mod/aur-pkgs/qtwebkit-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz")
sha256sums=('d0dd78ed9e951204de123ab7f8648aa90cde35d462fdd69050f6c92c5cdd5b78')

package() {
 install -d -m755 "$pkgdir"/usr/
 cp -a ${srcdir}/usr/ $pkgdir/usr/
}
