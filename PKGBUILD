# Maintainer: Konstantin <kostyapl@gmail.com>
# Contributor: Anton <deripas@yandex.ru>

pkgname=pachca-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="Corporate messenger for modern teams"
arch=('x86_64')
url="https://www.pachca.com/apps"
license=('custom')
conflicts=('pachca')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: Systray indicator support')
options=('!debug' '!strip')
source=("https://desktop.pachca.com/linux/deb/x64")
b2sums=('3d3cd922b8aea063c49d37d21bad99dd39e928f6ce11db84d7fcd18fecbb1615d5120f4e67e61faffceae20064adc07b733271cd8939dde9444ba6fcf20f9187')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz -C "$pkgdir"
}
