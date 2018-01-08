# Maintainer: Michal Donát <michal at donat dot cz>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

pkgname=gnome-shell-extension-no-topleft-hot-corner
_pkgname=nohotcorner
pkgver=16
_pkgver=${pkgver}.0
pkgrel=1
pkgdesc="Gnome shell extension disabling hotcorners"
arch=('any')
url="https://github.com/HROMANO/nohotcorner/"
license=('GPL2')
depends=('gnome-shell')
source=("https://github.com/HROMANO/${_pkgname}/archive/v${_pkgver}.tar.gz")
sha512sums=('e2e2f2045bd1690d825cda82dab1a75afbe1df4cfa97c53fcc8264f4bdb62f8f35876e966b02eea6e9a699982997c146065cd426122aa1df384fb4a478365b78')

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  for i in $(find -type f); do
    install -Dm 644 "$i" "${pkgdir}/usr/share/gnome-shell/extensions/nohotcorner@azuri.free.fr/${i}"
  done
}