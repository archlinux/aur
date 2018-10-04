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
pkgver=1.17.0beta.1
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.17.0-beta.1_amd64.deb")
sha256sums=('262e63788c0fcf38b79a48e356daf3fce33d29e2789e30b77dff1b8db3ba2a7f')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
