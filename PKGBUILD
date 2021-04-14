# Maintainer: ItzSelenux <zariepcommunication@gmail.com>

pkgname=papirus-folders-gui
pkgver=1.2
pkgrel=1
pkgdesc="change the folders color of the Papirus icon theme"
url="https://github.com/ItzSelenux/papirus-folders-gui"
arch=('any')
license=('LGPL2')
depends=('polkit-gnome' 'papirus-folders')
makedepends=('git')
provides=("papirus-folders-gui")
source=("$pkgname::git+https://github.com/ItzSelenux/papirus-folders-gui.git"
        "papirus-folders-gui.hook")
sha256sums=('SKIP'
            'SKIP')

package() {
  cd $pkgname
  cd papirus-folders-gui
  make
  mv papirus-folders-GUI papirus-folders-gui
  sudo cp papirus-folders-gui /usr/bin/
  sudo cp papirus.desktop /usr/share/applications/
}
