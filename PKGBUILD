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
provides=('signal-desktop')

pkgver=1.21.1beta.1
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.21.1-beta.1_amd64.deb")
sha256sums=('0e564df1f7581663221fbc6265bea6e923be806cc4624da5e6fedfa229b79704')


package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
