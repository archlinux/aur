# Maintainer: ElectricSteve <aur at electricsteve dot dev>

pkgname=flavortime-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="A Rust application that allows you to share your Flavortime referral code and hours coded on Discord!"
arch=('x86_64')
url="https://github.com/hackclub/flavortime"
license=('MIT OR Apache-2.0')
provides=('Flavortime')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source=("${url}/releases/download/v${pkgver}/Flavortime_${pkgver}_amd64.deb")
sha256sums=('6b214f75de3015825e41c73b842c3f8267c4b53f465b7c9470ef31ddbb88fb88')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}

