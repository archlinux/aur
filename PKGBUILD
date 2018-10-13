# Maintainer: elementh <lucasmmarino@icloud.com>
pkgname=flatplat-blue-theme
pkgrel=1
pkgver=3.30.1
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
sha256sums=('1a89015d9f64810f8ff1e3a7c23257fd1f6971a9ed738634b2da57dad6e7fe0e')

package() {
  cd "${srcdir}/Flat-Plat-Blue-$pkgver"
  export destdir="$pkgdir/"
  mkdir -p "${pkgdir}/usr/share/themes"
  ./install.sh --dest "${pkgdir}/usr/share/themes"
}
