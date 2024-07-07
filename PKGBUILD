# Maintainer: Marco33
pkgname=ggjj
pkgver=0.18.0
pkgrel=1
pkgdesc="GG - Gui for JJ"
arch=('x86_64')
url="https://github.com/gulbanana/gg"
license=('APACHE')
source=("https://github.com/gulbanana/gg/releases/download/v${pkgver}/gg_${pkgver}_amd64.deb")
sha256sums=('6cfed1faa6d9ef94d84ad10b91a1f03b7f56efdc208e4d268a28bd892d655284')

package() {
  bsdtar -zxf "$srcdir/data.tar.gz" -C "$pkgdir"
}

