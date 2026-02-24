# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-457
pkgname=arma3-unix-launcher-bin
pkgver=457.c21bbb8
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt6-base' 'qt6-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('e976ac41af8d51b7d1eb642e853acaeef97ccbb51cbbe7b176ebfc24bf6509c9')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
