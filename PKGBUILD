# Maintainer: Guru <anjanaya@gmail.com>
pkgname=velo-bin
pkgver=0.4.20
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
sha256sums=('c7f3e285078ee5ad5eaad0430ffc779819acfb5aa9b682658613c0860598e8ee')

package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
