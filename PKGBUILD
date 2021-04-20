# Maintainer: Matei Cotocel <mcotocel at outlook dot com>
pkgname=quiet-gtk-git
pkgver=r5.28017af
pkgrel=1
pkgdesc="Quiet theme for GTK"
arch=('any')
url="https://github.com/quiettheme/gtk"
license=('GPL')
groups=()
makedepends=('git')
source=("git+https://github.com/quiettheme/gtk")
md5sums=('SKIP')

pkgver() {
  cd gtk
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}/usr/share/themes/Quiet"
    cp -a "${srcdir}/gtk/Quiet/"* "${pkgdir}/usr/share/themes/Quiet/"
}
