# Maintainer: Daniel Cafe
# Contributor: 

pkgname=qogir-gtk-theme-git
pkgver=2018.10.12.1.gf48955d
pkgrel=1
pkgdesc='Qogir is a flat Design theme for GTK'
arch=('any')
url='https://github.com/vinceliuice/Qogir-theme'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
makedepends=('git')
optdepends=()
provides=('qogir-gtk-theme')
conflicts=('qogir-gtk-theme')
source=('git+https://github.com/vinceliuice/Qogir-theme')
sha256sums=('SKIP')

pkgver() {
  cd Qogir-theme
  git describe --tags | sed 's/-/./g'
}

package() {
  cd Qogir-theme
  mkdir -p "${pkgdir}/usr/share/themes"
  ./Install -d "${pkgdir}/usr/share/themes"
}


