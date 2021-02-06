# Maintainer: hamki <hamki.do2000@gmail.com>
pkgname=nordic-darker-standard-buttons-theme
_pkgname=Nordic-darker-standard-buttons
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
sha256sums=(8b947c2428af5df7c39f1e5b430819752be2f6bb5bee8eebd714e099b2d42e3f)

package() {
  cd "${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes/$_pkgname"
  cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
