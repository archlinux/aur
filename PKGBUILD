# Maintainer: Fernando Barillas <fbis251@mailbox.org>
pkgname=wire-desktop-bin
pkgver=2.11.2663
pkgrel=1
pkgdesc='Modern communication, full privacy.'
arch=('x86_64')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
source_x86_64=("https://wire-app.wire.com/linux/wire-${pkgver}-amd64.deb")
sha256sums_x86_64=(8feded93907e176345461c412bcc1b7682055c2ff9411c99fe05be686865ce1b)
package() {
  cd "$srcdir"
  ar xf "wire-${pkgver}-amd64.deb"
  tar xf data.tar.xz -C "$pkgdir"
}
