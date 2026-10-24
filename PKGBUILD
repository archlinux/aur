# Maintainer: dnt_tnd dnt_arch@proton.me

pkgname=pd2-trade-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Project Diablo 2 app for price checking"
arch=('x86_64')
url="https://github.com/errolgr/pd2-trade"
license=('MIT')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
  'libayatana-appindicator'
  'less'
)
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("PD2.Trader_${pkgver}_amd64.deb::${url}/releases/download/app-v${pkgver}/PD2.Trader_${pkgver}_amd64.deb")
sha256sums_x86_64=('afb852bd4248c812a3b6ff8d044f32e9471b6c61bb7992e8c0a999f94075e7fb')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
