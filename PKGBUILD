# Maintainer: leeteral <kneesdev@naver.com>

pkgname=pelton-bin
pkgver=2026.4.1
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
sha256sums=('4684176713e49c23a1dbf2a7d0bc60e38421e478c06038fd227a830345f4fc1f')

package() {
    tar -xzf data.tar.gz -C "$pkgdir"
}
