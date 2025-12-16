# Maintainer: infinite
pkgname=aonsoku-bin
pkgver=0.10.2
pkgrel=2
pkgdesc="A modern desktop client for Navidrome/Subsonic servers built with React and Electron"
arch=('x86_64')
url="https://github.com/victoralvesf/aonsoku"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux-libs' 'libsecret' 'libappindicator')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/victoralvesf/aonsoku/releases/download/v$pkgver/Aonsoku-v"$pkgver"-linux-amd64.deb")
sha256sums_x86_64=('1fc2b30986a4bc11aa9a963b3f638c77f17ff1569160ce7ac085c8cbe0d1e11d')

package() {
  # Extract package data
  tar -xf data.tar.xz -C "${pkgdir}"
}
