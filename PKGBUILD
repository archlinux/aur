# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-239
pkgname=arma3-unix-launcher-bin
pkgver=239.a593198
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('b2cce7a77ca54388a878bb3dda7aa0b2a32ae0ae7a76b23a5ddf4fd1bd8c855b')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
