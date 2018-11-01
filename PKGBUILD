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

pkgver=1.18.0beta.4
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.18.0-beta.4_amd64.deb")
sha256sums=('c3078ff36bcb84d1a47f5ce2316a974624f933090cc658de04225f3774446444')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
