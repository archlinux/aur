# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-187
pkgname=arma3-unix-launcher-bin
pkgver=187.d03ab92
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.xz")
sha256sums=('c55b540078142ae12df6c05241a80f8b6b234ef82259517156140ad1ff92b5a2')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
