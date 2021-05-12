# Maintainer: Јован Ђокић-Шумарац <sumarac@protonmail.com>
pkgname=fetchy-git
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="Cli system info tool written in C. "
arch=(x86_64)
url="https://gitlab.com/vojjvoda/fetchy.git"
license=('MIT')
groups=()
depends=()
makedepends=(make)
checkdepends=()
optdepends=()
provides=(fetchy)
conflicts=(fetchy)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
  cd fetchy
  make

}

package() {
  cd fetchy
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  
}


