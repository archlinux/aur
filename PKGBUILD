# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=gnome-shell-extension-taskwhisperer
_pkgname=taskwhisperer
pkgver=20
pkgrel=1
pkgdesc="Gnome Shell TaskWarrior integration"
arch=('any')
url="https://github.com/cinatic/taskwhisperer"
license=('GPL3')
depends=('gnome-shell')
source=("https://github.com/cinatic/taskwhisperer/archive/v${pkgver}.tar.gz")
sha256sums=('663d3d4d6997e517ab24b29ca75584d9ead69d36799e7c8aa91a95925bd4905e')

package() {
  _extid='taskwhisperer-extension@infinicode.de'
  install -dm755 "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "${_pkgname}-${pkgver}/${_extid}" "${pkgdir}/usr/share/gnome-shell/extensions"
}
