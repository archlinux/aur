# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=1.6.0beta.1
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.6.0-beta.1_amd64.deb")
sha512sums=('7103d7ca0f7742a702d1af357a2dc9a5e12aa6435dd51846265b3f5ddeb8a3a47f78a92d5e800e556b09e57dd20838f6910a8fd23de0b06bde68c441008c8294')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
