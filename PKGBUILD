# Maintainer: dnt_tnd dnt_arch@proton.me
pkgname=pd2-trade-bin
pkgver=0.9.13
pkgrel=1
pkgdesc="Project Diablo 2 app for price checking"
arch=('x86_64')
url="https://github.com/errolgr/pd2-trade"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/app-v${pkgver}/PD2.Trader_${pkgver}_amd64.deb")
sha256sums_x86_64=('e3d9779ca935372d9595b080758f993e4a111010e1a98af70ae24023b080ed1d')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
