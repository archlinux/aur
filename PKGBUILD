# Maintainer: ItzSelenux <zariepcommunication@gmail.com>
# Maintainer: yochananmarqos
pkgname=papirus-folders-gui-bin
pkgver=1.3
pkgrel=1
pkgdesc="A graphical user interface for papirus-folders, precompiled bin"
url="https://github.com/ItzSelenux/papirus-folders-gui"
arch=('x86_64')
license=('unknown')
depends=('polkit-gnome' 'papirus-folders' 'qt5-base')
provides=('papirus-folders-gui')
conflicts=('papirus-folders-gui')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d88379941911e8a34ac90ac722d8ffb59cd03e2c8e675f4aa7779a5a7d1e4876') 
package() {
  ls
  cd "papirus-folders-gui-1.3/premaked-build"
  install -Dm755 "papirus-folders-gui" -t "$pkgdir/usr/bin"
  install -Dm644 papirus.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
