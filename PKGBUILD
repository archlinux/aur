# Maintainer: Marco33
pkgname=ggjj
pkgver=0.36.2
pkgrel=1
pkgdesc="GG - Gui for JJ"
arch=('x86_64')
url="https://github.com/gulbanana/gg"
license=('APACHE')
source=("https://github.com/gulbanana/gg/releases/download/v${pkgver}/gg_${pkgver}_amd64.deb")
sha256sums=('f5d9ef558f5722ebd898afb1fb53c14ad9b6bc6e9d1a09f49623f1f8981c062f')

package() {
  bsdtar -zxf "$srcdir/data.tar.gz" -C "$pkgdir"
}

