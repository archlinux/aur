# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=thonny-bin
pkgver=5.0.0
pkgrel=1
pkgdesc="Python IDE for beginners (prebuilt, with bundled Python runtime)"
arch=('x86_64')
url="https://github.com/thonny/thonny"
license=('MIT')
# The bundled standalone CPython (python-build-standalone) links everything
# else - including tcl/tk 9 and its X11 client libraries - statically.
depends=('glibc' 'gcc-libs')
optdepends=('libnotify: desktop notifications (dlopened by Tk)')
provides=('thonny')
conflicts=('thonny')
options=('!strip')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('7baea7ff70d7aa6e86fa1153ba8f156d8f5a402ddb5279d8e15ceceb4aaa53e5')

package() {
  cp -a "$srcdir/opt" "$srcdir/usr" "$pkgdir/"
}
