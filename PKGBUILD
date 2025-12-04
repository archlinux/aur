# Maintainer: Marco33
pkgname=ggjj
pkgver=0.35.1
pkgrel=1
pkgdesc="GG - Gui for JJ"
arch=('x86_64')
url="https://github.com/gulbanana/gg"
license=('APACHE')
source=("https://github.com/gulbanana/gg/releases/download/v${pkgver}/gg_${pkgver}_amd64.deb")
sha256sums=('3e78bdea0aca66ce59a116734dcd8e1b45e6a049c10618ce02c15ceadfda2cc7')

package() {
  bsdtar -zxf "$srcdir/data.tar.gz" -C "$pkgdir"
}

