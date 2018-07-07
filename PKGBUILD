# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=1.13.0beta.2
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.13.0-beta.2_amd64.deb")
sha256sums=('503d9026f69d5706b70bd74bc9d51912b91b479f7d337823764e2a0f15923374')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
