# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=1.12.0beta.2
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.12.0-beta.2_amd64.deb")
sha256sums=('f0582f08053b06957c45f2064fc0f3157ccff4e3a2dccbbf823e06d4749dbfb6')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
