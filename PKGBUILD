# Maintainer: Marco33
pkgname=ggjj
pkgver=0.36.0
pkgrel=1
pkgdesc="GG - Gui for JJ"
arch=('x86_64')
url="https://github.com/gulbanana/gg"
license=('APACHE')
source=("https://github.com/gulbanana/gg/releases/download/v${pkgver}/gg_${pkgver}_amd64.deb")
sha256sums=('fdd379efe87be32bb35d5cccf874e3dd45947d14953f1eecfa7acf2c4c261618')

package() {
  bsdtar -zxf "$srcdir/data.tar.gz" -C "$pkgdir"
}

