# Maintainer: infinite
pkgname=aonsoku-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="A modern desktop client for Navidrome/Subsonic servers built with React and Electron"
arch=('x86_64')
url="https://github.com/victoralvesf/aonsoku"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux-libs' 'libsecret' 'libappindicator')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/victoralvesf/aonsoku/releases/download/v$pkgver/Aonsoku-v"$pkgver"-linux-amd64.deb")
sha256sums_x86_64=('d105137803fd1fc073a6c4a558f60d45d34682b808724948dccb740863892515')

package() {
  # Extract package data
  tar -xf data.tar.xz -C "${pkgdir}"
}
