# Maintainer: leeteral <kneesdev@naver.com>

pkgname=pelton-bin
pkgver=2026.3.4
pkgrel=1
pkgdesc="Open-source cross-platform desktop email client"
arch=('x86_64')
url="https://github.com/TRC-Loop/Pelton"
options=('!strip' '!debug')
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('pelton')
conflicts=('pelton')

source=("Pelton-v${pkgver}-linux-amd64.deb::https://github.com/TRC-Loop/Pelton/releases/download/v${pkgver}/Pelton-v${pkgver}-linux-amd64.deb")
sha256sums=('14ff147a172cf9fe55ff9dcc97e8268d5fd43dfc6c0ca0a0b628fb3bb0fd33f7')

package() {
    tar -xzf data.tar.gz -C "$pkgdir"
}
