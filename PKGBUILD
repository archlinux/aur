# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-353
pkgname=arma3-unix-launcher-bin
pkgver=353.323627c
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('6593d88c198f302d665926350f9594f7019a5eae0ed1ca719ada6b139616aed4')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
