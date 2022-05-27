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
  mkdir -p ${pkgdir}/opt/${pkgname} && cp -rf * ${pkgdir}/opt/${pkgname}
  sudo ln -s ${pkgdir}/opt/${pkgname}/scripts/devsak.sh /usr/local/bin/devsak
  sudo ln -s ${pkgdir}/opt/${pkgname}/scripts/uninstall.sh /usr/local/bin/uninstall_devsak
}
