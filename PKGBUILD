# Maintainer: Michal Donát <michal at donat dot cz>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

pkgname=gnome-shell-extension-no-topleft-hot-corner
_pkgname=nohotcorner
pkgver=17
_pkgver=${pkgver}.0
pkgrel=1
pkgdesc="Gnome shell extension disabling hotcorners"
arch=('any')
url="https://github.com/HROMANO/nohotcorner/"
license=('GPL2')
depends=('gnome-shell')
source=("https://github.com/HROMANO/${_pkgname}/archive/v${_pkgver}.tar.gz")
sha512sums=('3805da42ea133609d81edea21ac38eed2ceded4bc3e61f47e9785842a940e9e4db9d42af85ec39b15a42edf19a0ec029527ae0cf6c13a421ed594b4ca72c39e7')

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/nohotcorner@azuri.free.fr/${i}"
  done
}
