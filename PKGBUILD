# Maintainer: Quaid Perkins <perkins@quaid.me>
pkgname=crunched-icons
pkgver=0.1.1
pkgrel=1
pkgdesc="A clean and minimal icon theme for Linux."
arch=('any')
url="https://gitlab.com/quyx/crunched-icons"
license=('CC-BY-SA-4.0')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
makedepends=('git')
changelog="CHANGELOG.md"
options=(!strip)
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd "${srcdir}"/"${pkgname}"
  # use the repository's `install.sh` script to install the icon packs
  DESTDIR="${pkgdir}/usr/share/icons" ./install.sh
}
