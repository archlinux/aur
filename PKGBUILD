# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=gnome-shell-extension-taskwhisperer
_pkgname=taskwhisperer
pkgver=16
pkgrel=1
pkgdesc="Gnome Shell TaskWarrior integration"
arch=('any')
url="https://github.com/cinatic/taskwhisperer"
license=('GPL3')
depends=('gnome-shell')
source=("https://github.com/cinatic/taskwhisperer/archive/v${pkgver}.tar.gz")
sha256sums=('b52a721260267464322f27267b209c93d4cc91e722114273b9161e621504e3ea')

package() {
  _extid='taskwhisperer-extension@infinicode.de'
  install -dm755 "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "${_pkgname}-${pkgver}/${_extid}" "${pkgdir}/usr/share/gnome-shell/extensions"
}
