# Maintainer: Guru <anjanaya@gmail.com>
pkgname=velo-bin
pkgver=0.4.21
pkgrel=1
pkgdesc="A blazing-fast, keyboard-first desktop email client"
arch=('x86_64')
url="https://github.com/avihaymenahem/velo"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'hicolor-icon-theme')
provides=('velo')
conflicts=('velo')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://github.com/avihaymenahem/velo/releases/download/velo-v${pkgver}/Velo_${pkgver}_amd64.deb")
sha256sums=('56e4b4a895a560ffd1f3730fa1d003f0105e9efb7f4e26e376272a1c06bbadf7')

package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
