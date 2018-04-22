# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=1.8.0beta.1
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.8.0-beta.1_amd64.deb")
sha512sums=('e8bd9cb761ad83fa5d7d37e7e76d164315f93d06782ba68842261d47e8a09ab044cd347500e4d3f6fd0b17ce44e820bb9fb256c1bf539953c020e1f10c4c16cf')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
