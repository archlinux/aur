# Maintainer: infinite
pkgname=aonsoku-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="A modern desktop client for Navidrome/Subsonic servers built with React and Electron"
arch=('x86_64')
url="https://github.com/victoralvesf/aonsoku"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux-libs' 'libsecret' 'libappindicator')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/victoralvesf/aonsoku/releases/download/v$pkgver/Aonsoku-v"$pkgver"-linux-amd64.deb")
sha256sums_x86_64=('32d6fc99c8279ea73d2a446f65cf39fb964d8d34187d6b40c4378e35d92dd963')

package() {
  # Extract package data
  tar -xf data.tar.xz -C "${pkgdir}"
}
