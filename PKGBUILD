# Maintainer: nanpuyue <nanpuyue@gmail.com>

pkgname=devdocs-desktop-bin
pkgver=0.6.9
_debfile=DevDocs_${pkgver}_amd64.deb
pkgrel=1
pkgdesc="A full-featured desktop app for DevDocs.io."
arch=('x86_64')
url="https://devdocs.egoist.rocks/"
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
source=("$_debfile::https://github.com/egoist/devdocs-desktop/releases/download/v$pkgver/$_debfile")
sha256sums=('6bc53d31f7c462087f9c32154fe2935cc9d915f208d8ce6a213e15a164b36930')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

