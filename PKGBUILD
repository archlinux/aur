# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=gnome-shell-extension-taskwhisperer
_pkgname=taskwhisperer
pkgver=19
pkgrel=1
pkgdesc="Gnome Shell TaskWarrior integration"
arch=('any')
url="https://github.com/cinatic/taskwhisperer"
license=('GPL3')
depends=('gnome-shell')
source=("https://github.com/cinatic/taskwhisperer/archive/v${pkgver}.tar.gz")
sha256sums=('e076d2fc8e311f26937338ed161b57678167b5940ae53215c8fa7c3bc1b7e3fe')

package() {
  _extid='taskwhisperer-extension@infinicode.de'
  install -dm755 "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "${_pkgname}-${pkgver}/${_extid}" "${pkgdir}/usr/share/gnome-shell/extensions"
}
