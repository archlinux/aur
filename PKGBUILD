# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=gnome-shell-extension-taskwhisperer
_pkgname=taskwhisperer
pkgver=27
pkgrel=1
pkgdesc="Gnome Shell TaskWarrior integration"
arch=('any')
url="https://github.com/cinatic/taskwhisperer"
license=('GPL3')
depends=('gnome-shell')
source=("v${pkgver}.tar.gz::https://github.com/cinatic/taskwhisperer/releases/download/v${pkgver}/taskwhisperer-extension.zip")
sha256sums=('e31bde2e330c99c77964c92784df0453a827f770d5c4b944f42e8c11c40be805')

package() {
	install -dm755 "$pkgdir/usr/share/gnome-shell/extensions/taskwhisperer"
	cp -r . "${pkgdir}/usr/share/gnome-shell/extensions/taskwhisperer"
}
