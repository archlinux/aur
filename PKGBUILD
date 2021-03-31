# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=gnome-shell-extension-taskwhisperer
_pkgname=taskwhisperer
pkgver=18
pkgrel=1
pkgdesc="Gnome Shell TaskWarrior integration"
arch=('any')
url="https://github.com/cinatic/taskwhisperer"
license=('GPL3')
depends=('gnome-shell')
source=("https://github.com/cinatic/taskwhisperer/archive/v${pkgver}.tar.gz")
sha256sums=('df749d97cdacab1bc2c1c3f8681097a795bacc5475abba688bb89d5ade6f713c')

package() {
  _extid='taskwhisperer-extension@infinicode.de'
  install -dm755 "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "${_pkgname}-${pkgver}/${_extid}" "${pkgdir}/usr/share/gnome-shell/extensions"
}
