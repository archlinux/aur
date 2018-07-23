# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=v1.15.0beta.5
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.15.0-beta.5_amd64.deb")
sha256sums=('5cf7afb16b53549dbda9dea600dd51378cd5689bc57666fdb8c22eb2871d458e')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
