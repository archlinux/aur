# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=1.7.0beta.3
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.7.0-beta.3_amd64.deb")
sha512sums=('1c7e76833fa9fd49b4fa96cb395d3e314ea23f4c0c75dc6f6193657c1d738f066736a7d8186f30daa7404a6eb369802ace9b199c44665f5f56461eb1f1b50513')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
