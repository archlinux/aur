# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-156
pkgname=arma3-unix-launcher-bin
pkgver=156.19c28fe
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.xz")
sha256sums=('9718da1ee441946bf32852d9297ea321d832dc553163fd33af82fbe21f0e3f82')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
