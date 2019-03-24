# Maintainer: Michal Donát <michal at donat dot cz>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

pkgname=gnome-shell-extension-no-topleft-hot-corner
_pkgname=nohotcorner
pkgver=19
_pkgver=${pkgver}.0
pkgrel=1
pkgdesc="Gnome shell extension disabling hotcorners"
arch=('any')
url="https://github.com/HROMANO/nohotcorner/"
license=('GPL2')
depends=('gnome-shell')
source=("https://github.com/HROMANO/${_pkgname}/archive/v${_pkgver}.tar.gz")
sha512sums=('956df08717752a03f2320f628279d58b6887b35079c1f37f5172e6ad36b599425191edbe16c252ce104a6a5b8f792b73c60e3332bf1cf6bb0f1e70bc11bec984')

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/nohotcorner@azuri.free.fr/${i}"
  done
}
