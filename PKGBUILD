# Maintainer: Guru <anjanaya@gmail.com>
pkgname=velo-bin
pkgver=0.3.12
pkgrel=1
pkgdesc="A blazing-fast, keyboard-first desktop email client"
arch=('x86_64')
url="https://github.com/avihaymenahem/velo"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'hicolor-icon-theme')
provides=('velo')
conflicts=('velo')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://github.com/avihaymenahem/velo/releases/download/v${pkgver}/Velo_${pkgver}_amd64.deb")
sha256sums=('f6fdc3eac4b68c0d339cb25dc427284e7dca68728550a955fa427201a6527342')

package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
