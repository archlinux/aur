# Maintainer: Konstantin <kostyapl@gmail.com>
# Contributor: Anton <deripas@yandex.ru>

pkgname=pachca-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="Corporate messenger for modern teams"
arch=('x86_64')
url="https://www.pachca.com/apps"
license=('custom')
conflicts=('pachca')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: Systray indicator support')
options=('!debug' '!strip')
source=("Pachca-${pkgver}-amd64.deb::https://desktop.pachca.com/linux/deb/x64")
b2sums=('43c94a3d9aa2b606c3d2c696c41d197b396e2d77e1c3ed540433b86a713a31d1bbb4d72b850393fdbf0bc4763ed9306b1b59e87c6ba84d927f8ab0e6bd9bada9')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz -C "$pkgdir"
}
