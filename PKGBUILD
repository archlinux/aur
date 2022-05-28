pkgname=devsak-git
pkgver=0.0.1
pkgrel=1
pkgdesc="DEVeloper's Swiss Army Knife"
arch=(x86_64)
url="https://github.com/hristotanev/devsak.git"
license=('GPL')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(devsak)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
  cd devsak
  sudo mkdir -p /opt/${pkgname}
  sudo cp -rf * /opt/${pkgname}
  /opt/devsak-git/scripts/install.sh
}
