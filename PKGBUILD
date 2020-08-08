# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-235
pkgname=arma3-unix-launcher-bin
pkgver=235.cae599b
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('78f3b974020f5bed00ec8d4747ebb8f4e670ce57a3cabdf4690acab37cbe81d8')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
