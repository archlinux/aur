# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install

pkgver=1.18.0beta.6
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.18.0-beta.6_amd64.deb")
sha256sums=('d9dabfd8710377f79fb6aedfcb886913a8078be988fe4ee30442f7cf5275a83e')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
