# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-277
pkgname=arma3-unix-launcher-bin
pkgver=277.51dbf12
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('4111e21bd3c4ed4486fbbccd4050a910c2f6a0b1c756881feb3d755e49a30c24')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
