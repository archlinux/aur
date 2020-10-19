# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-250
pkgname=arma3-unix-launcher-bin
pkgver=250.918efff
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('2ba4dd20648571422506049782efb17cf5c5582ef85dbd09e84e91dee2c7b5f9')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
