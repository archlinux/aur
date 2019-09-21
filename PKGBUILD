# Maintainer: elementh <lucasmmarino@icloud.com>
pkgname=flatplat-blue-theme
pkgrel=1
pkgver=3.34.0
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
sha256sums=('52485305a7c0394a6426b14d5ec32b6d3d257052565bcf31bcc5dd87cf404b53')

package() {
  cd "${srcdir}/Flat-Plat-Blue-$pkgver"
  export destdir="$pkgdir/"
  mkdir -p "${pkgdir}/usr/share/themes"
  ./install.sh --dest "${pkgdir}/usr/share/themes"
}
