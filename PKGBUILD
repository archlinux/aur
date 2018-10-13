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
pkgver=1.17.0beta.2
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.17.0-beta.2_amd64.deb")
sha256sums=('3281b3d0e5e35e070f59ce741c5068b9c6b679041bd67511625a8706d2c080b3')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
