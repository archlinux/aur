# Maintainer: Fernando Barillas <fbis251@mailbox.org>
pkgname=wire-desktop-bin
pkgver=2.11.2661
pkgrel=2
pkgdesc='Modern communication, full privacy.'
arch=('x86_64')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
source_x86_64=("https://wire-app.wire.com/linux/wire_${pkgver}_amd64.deb")
sha256sums_x86_64=(1ddccb710fb04a62c876c71df23aa36c64ce5d25525da53041ca587bb20e1a19)

package() {
  cd "$srcdir"
  ar xf "wire_${pkgver}_amd64.deb"
  tar xf data.tar.xz -C "$pkgdir"
}
