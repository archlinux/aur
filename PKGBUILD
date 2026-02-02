# Maintainer: infinite
pkgname=aonsoku-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A modern desktop client for Navidrome/Subsonic servers built with React and Electron"
arch=('x86_64')
url="https://github.com/victoralvesf/aonsoku"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux-libs' 'libsecret' 'libappindicator')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/victoralvesf/aonsoku/releases/download/v$pkgver/Aonsoku-v"$pkgver"-linux-amd64.deb")
sha256sums_x86_64=('d2d28fd0f9b92ff8ece9173ad629fb09ea027d754ac6c029233f22d256ed6be1')

package() {
  # Extract package data
  tar -xf data.tar.xz -C "${pkgdir}"
}
