# Maintainer: Marco33
pkgname=ggjj
pkgver=0.29.0
pkgrel=1
pkgdesc="GG - Gui for JJ"
arch=('x86_64')
url="https://github.com/gulbanana/gg"
license=('APACHE')
source=("https://github.com/gulbanana/gg/releases/download/v${pkgver}/gg_${pkgver}_amd64.deb")
sha256sums=('bca82ad61c958b138184126b2ba77823dabf289ffbd111b7523e3a9bcd08a99d')

package() {
  bsdtar -zxf "$srcdir/data.tar.gz" -C "$pkgdir"
}

