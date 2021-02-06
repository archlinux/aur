# Maintainer: hamki <hamki.do2000@gmail.com>
pkgname=nordic-darker-theme
_pkgname=Nordic-darker
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
sha256sums=(63f4a3d634507b28660072c42fca6aa8eb51573e5b1d5307bd2a2e789c04373b)

package() {
  cd "${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes/$_pkgname"
  cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
