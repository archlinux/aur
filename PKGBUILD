# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=1.15.0beta.8
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.15.0-beta.8_amd64.deb")
sha256sums=('7bcc83b4762cbf14454b1ae49e21d32f96d22b021fa5fc6ca59e5aeab7ae23b3')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
