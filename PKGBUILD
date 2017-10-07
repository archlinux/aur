# Maintainer: elementh <lucasmmarino@icloud.com>
pkgname=flatplat-blue-theme
pkgrel=1
pkgver=3.26.0
pkgdesc="Flat-Plat-Blue Theme is a GNOME Shell/GTK Theme forked from Flat-Plat Theme with blue tones"
arch=('any')
url="https://github.com/peterychuang/Flat-Plat-Blue"
license=('GPL2')
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-standard')
optdepends=()
provides=('flatplat-blue-theme')
conflicts=()
replaces=()
source=(Flat-Plat-Blue-3.26.0-2::"https://github.com/peterychuang/Flat-Plat-Blue/archive/3.26.0-2.tar.gz")
sha256sums=('6c8fc49e18c8296e835d0dade6964f1f7ef07ad4dcf5a11b34c205d9bc73c328')

package() {
  cd "${srcdir}/Flat-Plat-Blue-3.26.0-2"
  destdir="${pkgdir}" ./install.sh
}
