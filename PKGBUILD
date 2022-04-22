# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=gnome-shell-extension-taskwhisperer
_pkgname=taskwhisperer
pkgver=22
pkgrel=1
pkgdesc="Gnome Shell TaskWarrior integration"
arch=('any')
url="https://github.com/cinatic/taskwhisperer"
license=('GPL3')
depends=('gnome-shell')
source=("v${pkgver}.tar.gz::https://github.com/cinatic/taskwhisperer/releases/download/v${pkgver}/taskwhisperer-extension.zip")
sha256sums=('2ce8ab02d53f97a525697dff8d952b119fa5123dc3a5abfef4d0a9b42ec9e293')

package() {
  install -dm755 "$pkgdir/usr/share/gnome-shell/extensions/taskwhisperer"
  cp -r . "${pkgdir}/usr/share/gnome-shell/extensions/taskwhisperer"
}
