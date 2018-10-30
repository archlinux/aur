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

pkgver=1.18.0beta.3
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.18.0-beta.3_amd64.deb")
sha256sums=('6c76417662f84963210ee4028a2e4245489af4c2a1a5735956307bf7ff207f8c')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
