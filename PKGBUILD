# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-257
pkgname=arma3-unix-launcher-bin
pkgver=257.7017f69
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-archlinux-x86_64.pkg.tar.zst")
sha256sums=('81854eed5186af973f81318e556c997513602b326cee657fddb39b801b49b511')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
