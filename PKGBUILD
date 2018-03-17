# Maintainer: Nemo <archlinux at captnemo dot in>
pkgname=signal-desktop-beta-bin
pkgver=1.7.0beta.1
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url="https://github.com/WhisperSystems/Signal-Desktop#readme"
license=('GPL3')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.7.0-beta.1_amd64.deb")
sha512sums=('2309314cc272b81603dd5c4548bd60ecce7b6c589aed1d11c6d48c3769c2e6af566c543898463822ad1b22e6734fbcf0bf1673afd07e9be4e832aa2e1b4dbef7')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
}
