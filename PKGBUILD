# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=v1.15.0beta.6
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.15.0-beta.6_amd64.deb")
sha256sums=('f0fc24ea958d4e584de338f04fe9f7c4e2ddf53d45cffc31af40bb7639e78efe')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
