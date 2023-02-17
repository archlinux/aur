# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=wallhaven-desktop-bin
_pkgname=wallhaven-desktop
pkgver=0.0.1
pkgrel=0
pkgdesc="Unofficial desktop client for wallhaven.cc"
arch=('x86_64')
url="https://github.com/Pylogmon/wallhaven-desktop"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/Pylogmon/wallhaven-desktop/releases/download/${pkgver}/wallhaven-desktop_${pkgver}_amd64.deb")

sha512sums=('5ed16a7bac59addfebfeeba3f3b940e00b0e0e346e3307301a6884805c48ae5d05886a7d97344bb6d35e42f37f55675981e6de2b3fae7351822831d5c351223f')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
