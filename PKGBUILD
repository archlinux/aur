# Maintainer: dnt_tnd dnt_arch@proton.me

pkgname=pd2-trade-bin
pkgver=0.10.8
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
sha256sums_x86_64=('b079a47aabecb5b637cbdb6e03df0a7805049253fbbc3e23078cc7325f6141f8')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
