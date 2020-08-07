# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-225
pkgname=arma3-unix-launcher-bin
pkgver=225.bd91d02
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.xz")
sha256sums=('3108dc879b28984e14741591ba2c60a0ba1fd521d29ec11e498f3f29ad00b125')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
