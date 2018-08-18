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
pkgver=1.15.5beta.1
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.15.5-beta.1_amd64.deb")
sha256sums=('c2e8458e1a4196822936dff91adc44354fbc562338a1d31fc56050bd698fba4c')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
