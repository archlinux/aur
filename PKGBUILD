# Maintainer: elementh <lucasmmarino@icloud.com>
pkgname=flatplat-blue-theme
pkgrel=1
pkgver=3.30.0
pkgdesc="A Material Design-like flat theme for GTK3, GTK2, and GNOME-Shell."
arch=('any')
url="https://github.com/peterychuang/Flat-Plat-Blue"
license=('GPL2')
depends=('gtk3>=3.18' 'gtk-engine-murrine' 'gnome-themes-standard')
optdepends=()
provides=('flatplat-blue-theme')
conflicts=()
replaces=()
source=(Flat-Plat-Blue-$pkgver::"https://github.com/peterychuang/Flat-Plat-Blue/archive/$pkgver.tar.gz")
sha256sums=('27cd96d928ae75b92d730658038a81495e19e823ee60e0bf6a604c96084f8d1b')

package() {
  cd "${srcdir}/Flat-Plat-Blue-$pkgver"
  export destdir="$pkgdir/"
  mkdir -p "${pkgdir}/usr/share/themes"
  ./install.sh --dest "${pkgdir}/usr/share/themes"
}
