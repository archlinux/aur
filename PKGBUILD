# Maintainer: Konstantin <kostyapl@gmail.com>
# Contributor: Anton <deripas@yandex.ru>

pkgname=pachca-bin
pkgver=2.8.1
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
b2sums=('f945da7361a8efa281c8c67d80ab10ba33f6511fd3b3b39729e9cb40543b17388431e1a948bfe7a1b7b2177580bae48573c91c8d9673684f5383f2c59955b4e8')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz -C "$pkgdir"
}
