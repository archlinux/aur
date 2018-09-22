# Maintainer: elementh <lucasmmarino@icloud.com>
pkgname=flatplat-blue-theme
pkgrel=1
pkgver=3.28.1
pkgdesc="A Material Design-like flat theme for GTK3, GTK2, and GNOME-Shell."
arch=('any')
url="https://github.com/peterychuang/Flat-Plat-Blue"
license=('GPL2')
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-standard')
optdepends=()
provides=('flatplat-blue-theme')
conflicts=()
replaces=()
source=(Flat-Plat-Blue-3.28.1::"https://github.com/peterychuang/Flat-Plat-Blue/archive/3.28.1.tar.gz")
sha256sums=('f9b8e2b7350087891962e3dc694734e4f8742b83dc498ff8ee4c5dee03d84c3b')

package() {
  cd "${srcdir}/Flat-Plat-Blue-3.28.1"
  destdir="${pkgdir}" ./install.sh
}
