# Maintainer: Michal Donát <michal at donat dot cz>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

pkgname=gnome-shell-extension-no-topleft-hot-corner
_pkgname=nohotcorner
pkgver=18
_pkgver=${pkgver}.0
pkgrel=1
pkgdesc="Gnome shell extension disabling hotcorners"
arch=('any')
url="https://github.com/HROMANO/nohotcorner/"
license=('GPL2')
depends=('gnome-shell')
source=("https://github.com/HROMANO/${_pkgname}/archive/v${_pkgver}.tar.gz")
sha512sums=('7481d3f8a6ae2778c0852d6970079a7f5bfdae13203a65b27ff8a9b51004c62a4880151f2f9d14efc72cff293e8d3fc778a826ebbdd633f9d0a1cee67483f109')

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/nohotcorner@azuri.free.fr/${i}"
  done
}
