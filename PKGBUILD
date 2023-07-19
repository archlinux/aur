# Maintainer: 0xjac <aur at 0xjac dot com>

pkgname=alephium-wallet-bin
pkgdesc="The official Alephium desktop wallet."
pkgver=2.1.2
pkgrel=1
arch=('x86_64')
url="https://github.com/alephium/alephium-wallet"
license=('LGPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/alephium/desktop-wallet/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_x86_64=('c5e95587289a7617b5fcc7dabbffb5c140de8c51bfa59c10628d65e57305a9da')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3'
    'hicolor-icon-theme' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext'
    'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango')
optdepends=('libappindicator-gtk3')

package() {
	tar -xf data.tar.xz -C "$pkgdir"
}
