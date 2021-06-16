# Maintainer: hamki <hamki.do2000@gmail.com>
pkgname=nordic-darker-theme
_pkgname=Nordic-darker
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="Nordic is a Gtk3.20+ theme created using the awesome Nord color pallete."
arch=('i686' 'x86_64')
url="https://github.com/EliverLara/Nordic"
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/EliverLara/Nordic/releases/download/$pkgver/$_pkgname.tar.xz"
)
noextract=()
sha256sums=(fb9057fbb419cb0e598ec984e93bb2289909fe57e35e40a9833da226dbd5a774)

package() {
  cd "${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes/$_pkgname"
  cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
