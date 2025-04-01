# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_gittag=commit-420
pkgname=arma3-unix-launcher-bin
pkgver=420.5b3bf5e
pkgrel=1
pkgdesc="Launcher for ArmA 3 on Linux and Mac OS X (with Steamworks SDK)"
arch=('x86_64')
url="https://github.com/muttleyxd/arma3-unix-launcher"
license=('MIT')
depends=('fmt' 'pugixml' 'qt5-base' 'qt5-svg' 'spdlog')
provides=('arma3-unix-launcher')
conflicts=('arma3-unix-launcher')
source=("https://github.com/muttleyxd/arma3-unix-launcher/releases/download/$_gittag/arma3-unix-launcher-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('41d7308e5d8546c91a94a391c4de5ee93740e5ae762c9d0b19ebd5aa0aa6b02b')

package() 
{
    cp -r "$srcdir/usr" "$pkgdir/usr"
}
