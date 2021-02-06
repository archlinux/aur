# Maintainer: hamki <hamki.do2000@gmail.com>
pkgname=nordic-standard-buttons-theme
_pkgname=Nordic-standard-buttons
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
sha256sums=(18b84c0bbdd83dc4a61425f7570469a846b2d462a67b617e3734dd9d43b76838)

package() {
  cd "${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes/$_pkgname"
  cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
