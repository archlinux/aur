# Maintainer: hamki <hamki.do2000@gmail.com>
pkgname=nordic-bluish-accent-standard-buttons-theme
_pkgname=Nordic-bluish-accent-standard-buttons
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
sha256sums=(6bc68c1ec4d2dcafa12dbf9eebd81490af5ed4389eb3f4139934ee230eaacc66)

package() {
  cd "${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes/$_pkgname"
  cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
