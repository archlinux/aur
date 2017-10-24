# Maintainer: elementh <lucasmmarino@icloud.com>
pkgname=flatplat-blue-theme
pkgrel=1
pkgver=3.26.1
pkgdesc="Flat-Plat-Blue Theme is a GNOME Shell/GTK Theme forked from Flat-Plat Theme with blue tones"
arch=('any')
url="https://github.com/peterychuang/Flat-Plat-Blue"
license=('GPL2')
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-standard')
optdepends=()
provides=('flatplat-blue-theme')
conflicts=()
replaces=()
source=(Flat-Plat-Blue-3.26.1::"https://github.com/peterychuang/Flat-Plat-Blue/archive/3.26.1.tar.gz")
sha256sums=('eca32af809ccf08afa0cd0d9559aa5f7fec61388f4a47ac17933724f96f44adc')

package() {
  cd "${srcdir}/Flat-Plat-Blue-3.26.1"
  destdir="${pkgdir}" ./install.sh
}
