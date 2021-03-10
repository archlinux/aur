# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=gnome-shell-extension-taskwhisperer
_pkgname=taskwhisperer
pkgver=17
pkgrel=1
pkgdesc="Gnome Shell TaskWarrior integration"
arch=('any')
url="https://github.com/cinatic/taskwhisperer"
license=('GPL3')
depends=('gnome-shell')
source=("https://github.com/cinatic/taskwhisperer/archive/v${pkgver}.tar.gz")
sha256sums=('0b28cb602c6d674ae141951941c6417b4f96895cb0686c79d3b9aa6bf63a0e97')

package() {
  _extid='taskwhisperer-extension@infinicode.de'
  install -dm755 "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "${_pkgname}-${pkgver}/${_extid}" "${pkgdir}/usr/share/gnome-shell/extensions"
}
