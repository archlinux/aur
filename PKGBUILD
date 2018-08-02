# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=1.15.0beta.7
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.15.0-beta.7_amd64.deb")
sha256sums=('fed44466b4fa1e54ae6cbe3a1f662834385c418ce99d33d3835237dc1434a958')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
