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

pkgver=1.18.0beta.7
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.18.0-beta.7_amd64.deb")
sha256sums=('67c415e8741679a4a42be77dda41c4e4dccca6f6f4b6ba133cd22fdda7b67150')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
