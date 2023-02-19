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

sha512sums=('990e791e7f848ba77a69325f864e1acea604528d4515ca6f26ca59ac5237544c337d78cf7f2b1c43914d895736fb42b95a32c57beeb1d2b19a6047d92010d2c3')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
