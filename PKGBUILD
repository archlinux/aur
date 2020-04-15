# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-170
pkgname=arma3-unix-launcher-bin
pkgver=170.ca3b5df
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.xz")
sha256sums=('6b66e4bb0436502d6bb04dbedcd784354c4b7316bde04863188627a6a12a4f28')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
