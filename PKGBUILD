# Maintainer: Jakub Fedak <jakubfedak1030@gmail.com>
# Maintainer: Filip Synowiec <fsynowiec00@gmail.com>
pkgname=desktop-config-git
pkgver=1.0
pkgrel=1
pkgdesc="Graphical environment configuration tool"
arch=('any')
url="https://gitlab.com/ia-projekt-zespolowy-2021-2022/desktop-config"
license=('GPL')
depends=('python')
makedepends=('git' 'make')
source=("desktop-config::git+https://gitlab.com/ia-projekt-zespolowy-2021-2022/desktop-config.git")
md5sums=("SKIP")

package() {
   cd "desktop-config"
   make DESTDIR="${pkgdir}" PREFIX=/usr install
}