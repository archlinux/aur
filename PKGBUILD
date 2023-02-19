# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=wallhaven-desktop-bin
_pkgname=wallhaven-desktop
pkgver=0.0.0
pkgrel=0
pkgdesc="Unofficial desktop client for wallhaven.cc"
arch=('x86_64')
url="https://github.com/Pylogmon/wallhaven-desktop"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/Pylogmon/wallhaven-desktop/releases/download/${pkgver}/wallhaven-desktop_${pkgver}_amd64.deb")

sha512sums=('9b44a10b23166c223cd598c0b70fd114bd791ff2977567d465e4ab5974a4286839e58876821f31128c6921b2fa83e9654811f01027680f6c6f28fb0d6ec552a9')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
