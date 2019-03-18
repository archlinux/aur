# Maintainer: elementh <lucasmmarino@icloud.com>
pkgname=flatplat-blue-theme
pkgrel=1
pkgver=3.32.0
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
sha256sums=('5f0a8632dffbdc628c20f541d59dc0fa757021843c1daa49afbc9c15bd998dcc')

package() {
  cd "${srcdir}/Flat-Plat-Blue-$pkgver"
  export destdir="$pkgdir/"
  mkdir -p "${pkgdir}/usr/share/themes"
  ./install.sh --dest "${pkgdir}/usr/share/themes"
}
