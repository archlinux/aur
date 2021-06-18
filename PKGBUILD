# Maintainer: ItzSelenux <zariepcommunication@gmail.com>
# Maintainer: yochananmarqos
pkgname=papirus-folders-gui-bin
pkgver=1.4
pkgrel=1
pkgdesc="A graphical user interface for papirus-folders, precompiled bin"
url="https://github.com/ItzSelenux/papirus-folders-gui"
arch=('x86_64')
license=('unknown')
depends=('papirus-folders' 'qt5-base')
optdepends=('mate-polkit: Polkit Authentication agent, not required on most DE')
provides=('papirus-folders-gui')
conflicts=('papirus-folders-gui')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b40aa996923a551f55f2f525687a845d29cb9110f0187b11dd8954bb2d70ee32') 
package() {
  ls
  cd "papirus-folders-gui-1.4/premaked-build"
  install -Dm755 "papirus-folders-gui" -t "$pkgdir/usr/bin"
  install -Dm644 papirus.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
