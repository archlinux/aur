# Maintainer: Konstantin <kostyapl@gmail.com>
# Contributor: Anton <deripas@yandex.ru>

pkgname=pachca-bin
pkgver=2.8.0
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
b2sums=('1f70aa4f987df9b1d4c1f2be5e2022cbb54882c6ce3bff9be47f8c7c251299114f8f41252f66ee36db0de1b26c679b47a20f6ac556177735a87930a511a38f07')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz -C "$pkgdir"
}
