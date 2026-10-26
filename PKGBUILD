# Maintainer: leeteral <kneesdev@naver.com>

pkgname=pelton-bin
pkgver=2026.4.6
pkgrel=1
pkgdesc="Open-source cross-platform desktop email client"
arch=('x86_64')
url="https://github.com/peltonapp/Pelton"
options=('!strip' '!debug')
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('pelton')
conflicts=('pelton')

source=("Pelton-v${pkgver}-linux-amd64.deb::https://github.com/peltonapp/Pelton/releases/download/v${pkgver}/Pelton-v${pkgver}-linux-amd64.deb")
sha256sums=('288c9e208bdfb4be9ce36267b87765139eda0943f2bdcacea10f44d6ffd1c906')

package() {
    tar -xzf data.tar.gz -C "$pkgdir"
}
