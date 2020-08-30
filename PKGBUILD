# Maintainer JohnGavr <gavriilidisg@tutanota.com>

pkgname=artix-dark-theme
pkgver=20200130
pkgrel=1
pkgdesc="Dark Artix theme - GTK2/3, QT5, Plasma splash "
arch=('any')
url="https://gitea.artixlinux.org/nous/artix-dark-theme"
license=('GPL')
source=('git+https://gitea.artixlinux.org/nous/artix-dark-theme.git')
sha256sums=('SKIP')
makedepends=('git')
optdepends=('gtk2' 'gtk3' 'qt5' 'plasma' 'gtk-engines' 'xcursor-premium' 'qt5ct' 'openbox' 'gtk-engine-murrine')

package() {
  cd "${srcdir}/$pkgname"
  mkdir -p "${pkgdir}"/usr/share/themes
  cp -rf usr "${pkgdir}"/
}
