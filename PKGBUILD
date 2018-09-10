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
pkgver=1.16.1beta.1
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.16.1-beta.1_amd64.deb")
sha256sums=('b9b66198cddfe0fe672a72f377d6bc83e577b0c340f34bd286fd979a6e476933')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
