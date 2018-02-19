# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=1.4.0beta.1
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxss' 'libxtst' 'nss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.4.0-beta.1_amd64.deb")
sha512sums=('72becf5c4ad3090c3cdc386e6872b7b17b77cca4b3e01cf492e3be8a99ab49e7b81ffdd02db215f7c6620c7237e92a94904e87aa7e16127a8d83a5680e99dfbe')
package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
