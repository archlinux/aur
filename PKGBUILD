# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=1.11.0beta.3
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.11.0-beta.3_amd64.deb")
sha256sums=('3ce51116406c0bb87084067dfbc2ac82c24bddd922b239f3ff0662a7c82079bd')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
