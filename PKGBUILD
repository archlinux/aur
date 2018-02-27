# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=1.5.0beta.1
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.5.0-beta.1_amd64.deb")
sha512sums=('c70f1124b8fd701c6961253ad881d86fa1a250b51640edb553e578ff586daeccc0f63706767671f13fccc19efd533584f0378f208093ac744d05d955bbb571e9')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
