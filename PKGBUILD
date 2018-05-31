# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=1.12.0beta.1
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.12.0-beta.1_amd64.deb")
sha256sums=('b464a0eedd10dba63ea94302a4436cd71403567c4e3e1ce2aa166bc347f4b833')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
