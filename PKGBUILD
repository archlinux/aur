# Maintainer: hamki <hamki.do2000@gmail.com>
pkgname=nordic-bluish-accent-standard-buttons-theme
_pkgname=Nordic-bluish-accent-standard-buttons
pkgver=1.9.0
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
source=("https://github.com/EliverLara/Nordic/releases/download/v$pkgver/$_pkgname.tar.xz"
)
noextract=()
sha256sums=(07fc4db78e5c895982e7c7a7b21fa1572da75939acc23e203dd037dbb6132dad)

package() {
  cd "${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes/$_pkgname"
  cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
