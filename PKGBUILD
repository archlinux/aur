# Maintainer: 2ion
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >
pkgname=ttf-din1451
pkgver=20100402
pkgrel=3
pkgdesc='Clone of the DIN1451 font as used on German roadsigns'
arch=('any')
url='https://github.com/2ion/ttf-din1451'
license=('custom:unknown')
source=("https://github.com/2ion/ttf-din1451/archive/${pkgver}.tar.gz")
sha256sums=('a36834c573c4504e088d90ce2f85237a015ee69a15412612e7e6a109fef7ac29')
sha512sums=('26ad9ca69dc48da0091546067ffa90a7661ac319ee7c33c5fcaad913258802e36514c84b776cf8eec28ba8666460905acb613a2544c9dbc905a0e5b55447ef92')
install=${pkgname}.install

package() {
  cd "${pkgname}-${pkgver}/postprocessed"
  for fontfile in *.ttf; do
    install -Dm644 "$fontfile" "${pkgdir}/usr/share/fonts/${pkgname}/${fontfile}"
  done
}
