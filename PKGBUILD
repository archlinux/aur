# Maintainer: Konstantin <kostyapl@gmail.com>
# Contributor: Anton <deripas@yandex.ru>

pkgname=pachca-bin
pkgver=2.8.5
pkgrel=1
pkgdesc="Corporate messenger for modern teams"
arch=('x86_64')
url="https://www.pachca.com/apps"
license=('custom')
conflicts=('pachca')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: Systray indicator support')
options=('!debug' '!strip')
source=("Pachca-${pkgver}-amd64.deb::https://install.pachca.com/linux/deb/x64")
b2sums=('d6176c06af7e40825ec0e4a3e9d84347a3ff0f09ea023ac967f04a14a266c50190df4be8be9ff6bc9f3d5e22a03a851e3972a2036eff0a025eadec2fe1a58684')

package() {
    cd "${srcdir}"
    bsdtar -xf data.tar.xz -C "$pkgdir"
}
