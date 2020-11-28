# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-262
pkgname=arma3-unix-launcher-bin
pkgver=262.8833c32
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('a20ce0330d1d79d65520f53d0326a8ac78180bd3e6f617c876e222b7907233e5')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
