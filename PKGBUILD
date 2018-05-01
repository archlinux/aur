# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=1.10.0beta.1
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.10.0-beta.1_amd64.deb")
sha256sums=('e091aa94614e6d5fb1424b0ed0b0e767887766ebf17dcbbcf94bedebc8fbaf4d')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
