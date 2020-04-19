# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-172
pkgname=arma3-unix-launcher-bin
pkgver=172.df66d82
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.xz")
sha256sums=('3359b6ad7d3ddeb6568a70314ccf2a90a4729181606cccc3832b8ec8a9080263')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
