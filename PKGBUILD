# Maintainer: Guru <anjanaya@gmail.com>
pkgname=velo-bin
pkgver=0.4.4
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
sha256sums=('f74a668a552048bde3a5240d9d1193fe3a13c5d41c44eb924159c414a209ae3d')

package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
