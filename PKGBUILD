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

pkgver=1.17.0beta.4
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.17.0-beta.4_amd64.deb")
sha256sums=('8e4289d433f50240c33b956282bed1130641d23a0d7d63498fc9fb8f4c1ac543')


package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
