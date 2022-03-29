# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-355
pkgname=arma3-unix-launcher-bin
pkgver=355.8e10137
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('5efa19c910d3f4c2d41a279202ef9ac792b0840314c2ed8b8b8ad757ff460277')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
