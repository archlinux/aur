# Maintainer: hamki <hamki.do2000@gmail.com>
pkgname=nordic-darker-standard-buttons-theme
_pkgname=Nordic-darker-standard-buttons
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
sha256sums=(11b42aaada541eef69fd223aff66488c8180003db4c4894521e100a5f3a0b960)

package() {
  cd "${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes/$_pkgname"
  cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
